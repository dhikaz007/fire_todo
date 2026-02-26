import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../../constant/constant.dart';
import '../../../../helper/loading.dart';
import '../../../../shared/local_db/domain/i_hive_repository.dart';
import '../../../../shared/local_db/domain/models/profile_hive.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../../todo/domain/models/models.dart';
import '../../../todo/presentation/cubit/todo_cubit.dart';
import 'widgets/widgets.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  // final user = HiveService().getProfileValue();
  late ProfileHive? user;

  @override
  void initState() {
    super.initState();
    user = Modular.get<IHiveRepository>().getProfileValue();
    context.read<TodoCubit>().loadTodo();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModularListener<TodoCubit, TodoState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => LoadingHelper.showLoad(context),
          failed: (errorMessage) async {
            LoadingHelper.hideLoad(context);
            if (!context.mounted) return;
            await SnackbarApp.showSnackbar(context,
                msg: errorMessage, type: SnackbarType.failed);
          },
          edit: (response) async {
            LoadingHelper.hideLoad(context);
            Navigator.of(context).pop();
            await SnackbarApp.showSnackbar(
              context,
              msg: 'Successfully edited',
              type: SnackbarType.success,
            );
            if (!context.mounted) return;
            context.read<TodoCubit>().loadTodo();
          },
          delete: (response) async {
            LoadingHelper.hideLoad(context);
            Navigator.of(context).pop();
            await SnackbarApp.showSnackbar(
              context,
              msg: response,
              type: SnackbarType.success,
            );
            if (!context.mounted) return;
            context.read<TodoCubit>().loadTodo();
          },
          orElse: () => LoadingHelper.hideLoad(context),
        );
      },
      child: Scaffold(
        backgroundColor: ColorApp.primary2(10),
        body: Scrollbar(
          child: RefreshIndicator.adaptive(
            onRefresh: () async {
              context.read<TodoCubit>().loadTodo();
            },
            child: SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 8,
                    bottom: MediaQuery.viewInsetsOf(context).bottom + 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: kToolbarHeight,
                      ),
                      child: NavigationToolbar(
                        leading: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorApp.primary(50),
                                shape: BoxShape.circle,
                              ),
                              child: TextApp(
                                text: user?.email[0] ?? '',
                                color: ColorApp.white,
                                weight: FontAppWeight.bold,
                                size: FontAppSize.font_16,
                              ),
                            ),
                            const Gap(12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const TextApp(
                                  text: "Hi, welcome back !",
                                  weight: FontAppWeight.semiBold,
                                  size: FontAppSize.font_16,
                                ),
                                TextApp(
                                  text: user?.email ?? '',
                                  size: FontAppSize.font_16,
                                  weight: FontAppWeight.medium,
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          visualDensity: VisualDensity.compact,
                          onPressed: () {
                            Modular.to.pushNamed('/notifications/');
                          },
                          icon: const Icon(
                            Icons.notifications,
                            color: ColorApp.black,
                          ),
                        ),
                      ),
                    ),
                    const Gap(12),
                    const TextApp(
                      text: 'Past',
                      size: FontAppSize.font_16,
                      weight: FontAppWeight.bold,
                      color: ColorApp.grey,
                    ),
                    const Gap(8),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 90,
                      ),
                      child: ModularBuilder<TodoCubit, TodoState>(
                        builder: (context, state) => state.maybeWhen(
                          loading: () => Center(
                            child: CircularProgressIndicator.adaptive(
                              valueColor:
                                  AlwaysStoppedAnimation(ColorApp.primary(50)),
                            ),
                          ),
                          failed: (errorMessage) => TextApp(text: errorMessage),
                          loaded: (response) {
                            final now = DateTime.now();
                            final upcomingTodos =
                                response.documents?.where((doc) {
                                      final dueDate =
                                          doc.fields?.dueDate?.timestampValue;
                                      return dueDate?.isBefore(now) ?? false;
                                    }).toList() ??
                                    [];

                            if (upcomingTodos.isEmpty) {
                              return Container(
                                alignment: Alignment.center,
                                width: double.maxFinite,
                                child: const TextApp(
                                  text: 'List is empty',
                                  size: FontAppSize.font_16,
                                  weight: FontAppWeight.semiBold,
                                ),
                              );
                            }

                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              itemCount: upcomingTodos.take(5).length,
                              separatorBuilder: (context, index) =>
                                  const Gap(12),
                              itemBuilder: (context, index) {
                                final datas = upcomingTodos[index];

                                return PastItemWidget(documentModel: datas);
                              },
                            );
                          },
                          orElse: () => const TextApp(text: 'No Past Todo'),
                        ),
                      ),
                    ),
                    const Gap(12),
                    TextApp(
                      text: 'Upcoming',
                      size: FontAppSize.font_16,
                      color: ColorApp.upcoming(50),
                      weight: FontAppWeight.bold,
                    ),
                    const Gap(8),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 90,
                      ),
                      child: ModularBuilder<TodoCubit, TodoState>(
                        builder: (context, state) => state.maybeWhen(
                          loading: () => Center(
                            child: CircularProgressIndicator.adaptive(
                              valueColor:
                                  AlwaysStoppedAnimation(ColorApp.primary(50)),
                            ),
                          ),
                          failed: (errorMessage) => TextApp(text: errorMessage),
                          loaded: (response) {
                            final now = DateTime.now();
                            final upcomingTodos =
                                response.documents?.where((doc) {
                                      final dueDate =
                                          doc.fields?.dueDate?.timestampValue;
                                      return dueDate?.isAfter(now) ?? false;
                                    }).toList() ??
                                    [];

                            if (upcomingTodos.isEmpty) {
                              return Container(
                                alignment: Alignment.center,
                                width: double.maxFinite,
                                child: const TextApp(
                                  text: 'List is empty',
                                  size: FontAppSize.font_16,
                                  weight: FontAppWeight.semiBold,
                                ),
                              );
                            }

                            return MediaQuery.removePadding(
                              context: context,
                              removeBottom: true,
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount: upcomingTodos.take(5).length,
                                separatorBuilder: (context, index) =>
                                    const Gap(12),
                                itemBuilder: (context, index) {
                                  final datas = upcomingTodos[index];

                                  return UpcomingItemWidget(
                                      documentModel: datas);
                                },
                              ),
                            );
                          },
                          orElse: () => const SizedBox.shrink(),
                        ),
                      ),
                    ),
                    const Gap(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextApp(
                          text: 'List',
                          size: FontAppSize.font_16,
                          weight: FontAppWeight.bold,
                        ),
                        TextButton(
                          onPressed: () {
                            Modular.to.pushNamed('/todo/list');
                          },
                          child: TextApp(
                            text: 'See all',
                            size: FontAppSize.font_14,
                            weight: FontAppWeight.medium,
                            color: ColorApp.primary(50),
                          ),
                        ),
                      ],
                    ),
                    ModularBuilder<TodoCubit, TodoState>(
                      builder: (context, state) {
                        // debugPrint(state.toString());
                        return state.maybeWhen(
                          loading: () => Container(
                            height: 300,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator.adaptive(
                              valueColor:
                                  AlwaysStoppedAnimation(ColorApp.primary(50)),
                            ),
                          ),
                          failed: (errorMessage) {
                            return Center(
                              child: TextApp(
                                text: errorMessage,
                                size: FontAppSize.font_16,
                              ),
                            );
                          },
                          loaded: (response) {
                            if (response.documents == null) {
                              return Container(
                                alignment: Alignment.center,
                                height: 300,
                                child: const TextApp(
                                  text: 'Data is empty',
                                  size: FontAppSize.font_16,
                                  weight: FontAppWeight.medium,
                                ),
                              );
                            }

                            return ListView.separated(
                              shrinkWrap: true,
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  response.documents?.take(5).length ?? 1,
                              separatorBuilder: (context, index) =>
                                  const Gap(8),
                              itemBuilder: (context, index) {
                                final data = response.documents?[index] ??
                                    const DocumentModel();

                                return ListWidget(
                                  enableSlide: false,
                                  document: data,
                                  onComplete: (value) {
                                    value = data.fields?.isDone?.booleanValue;
                                  },
                                );
                              },
                            );
                          },
                          orElse: () => const SizedBox.shrink(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
