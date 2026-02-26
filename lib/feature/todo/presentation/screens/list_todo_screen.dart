import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../../constant/constant.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../../home/presentation/screens/widgets/widgets.dart';
import '../../domain/models/models.dart';
import '../cubit/todo_cubit.dart';

class ListTodoScreen extends StatefulWidget {
  const ListTodoScreen({super.key});

  @override
  State<ListTodoScreen> createState() => _ListTodoScreenState();
}

class _ListTodoScreenState extends State<ListTodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // context.read<TodoCubit>().loadTodo();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showEditDialog(BuildContext context, DocumentModel data) {
    _titleController.text = data.fields?.title?.stringValue ?? '';
    _descriptionController.text = data.fields?.description?.stringValue ?? '';

    showModalBottomSheet(
      context: context,
      backgroundColor: ColorApp.backgroundLight,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: false,
      isDismissible: false,
      builder: (context) => AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        curve: Curves.decelerate,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextApp(
                    text: 'Edit your todo',
                    size: FontAppSize.font_16,
                    weight: FontAppWeight.bold,
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.close,
                      color: ColorApp.black,
                    ),
                  ),
                ],
              ),
              const Gap(16),
              TextFormFieldApp(
                controller: _titleController,
                hintText: '',
                borderRadius: 8,
                textInputAction: TextInputAction.next,
                label: const TextApp(
                    text: 'Title',
                    size: FontAppSize.font_14,
                    weight: FontAppWeight.bold),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
              ),
              const Gap(12),
              TextFormFieldApp(
                controller: _descriptionController,
                hintText: '',
                borderRadius: 8,
                textInputAction: TextInputAction.next,
                label: const TextApp(
                    text: 'Description',
                    size: FontAppSize.font_14,
                    weight: FontAppWeight.bold),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
              ),
              const Gap(12),
              Row(
                children: [
                  Expanded(
                    child: ButtonPrimary(
                      label: 'Save',
                      onPressed: () {
                        debugPrint(_titleController.text);
                        debugPrint(_descriptionController.text);
                        context.read<TodoCubit>().editTodo(
                              id: data.name?.split('/').last ?? '',
                              title: _titleController.text,
                              description: _descriptionController.text,
                              isDone:
                                  data.fields?.isDone?.booleanValue ?? false,
                              dueDate: data.fields?.dueDate?.timestampValue ??
                                  DateTime.now(),
                            );
                      },
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: ButtonSecondary(
                      label: 'Cancel',
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, DocumentModel data) {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: const TextApp(
          text: 'Delete todo ?',
          size: FontAppSize.font_14,
          weight: FontAppWeight.medium,
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: ButtonPrimary(
                  label: 'Yes',
                  onPressed: () {
                    context
                        .read<TodoCubit>()
                        .deleteTodo(id: data.name?.split('/').last ?? '');
                  },
                ),
              ),
              const Gap(12),
              Expanded(
                child: ButtonSecondary(
                  label: 'No',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showOnCompleteDialog(
      BuildContext context, DocumentModel data, bool value) {
    showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog.adaptive(
        alignment: Alignment.center,
        title: const TextApp(
          text: 'Mark as completed ?',
          size: FontAppSize.font_14,
          weight: FontAppWeight.bold,
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: ButtonPrimary(
                  label: 'Ok',
                  onPressed: () {
                    value = true;
                    context.read<TodoCubit>().editTodo(
                          id: data.name?.split('/').last ?? '',
                          title: data.fields?.title?.stringValue ?? '',
                          description:
                              data.fields?.description?.stringValue ?? '',
                          isDone: value,
                          dueDate: data.fields?.dueDate?.timestampValue ??
                              DateTime.now(),
                        );
                  },
                ),
              ),
              const Gap(12),
              Expanded(
                child: ButtonSecondary(
                  label: 'Cancel',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundLight,
      body: ModularBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(ColorApp.primary(50)),
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
                return const Expanded(
                  child: Center(
                    child: TextApp(
                      text: 'Data is empty',
                      size: FontAppSize.font_16,
                      weight: FontAppWeight.medium,
                    ),
                  ),
                );
              }

              return SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxHeight: kToolbarHeight),
                      child: NavigationToolbar(
                        leading: BackButton(
                          color: ColorApp.black,
                          onPressed: () {
                            Modular.to.maybePop();
                          },
                        ),
                        centerMiddle: true,
                        middle: const TextApp(
                          text: 'My Todo',
                          size: FontAppSize.font_20,
                          weight: FontAppWeight.semiBold,
                        ),
                      ),
                    ),
                    ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shrinkWrap: true,
                      itemCount: response.documents?.length ?? 1,
                      separatorBuilder: (context, index) => const Gap(8),
                      itemBuilder: (context, index) {
                        final data =
                            response.documents?[index] ?? const DocumentModel();

                        return ListWidget(
                          document: data,
                          onEdit: (context) {
                            _showEditDialog(context, data);
                          },
                          onDelete: (context) {
                            _showDeleteDialog(context, data);
                          },
                          onTap: () {
                            Modular.to
                                .pushNamed('/todo/detail', arguments: data);
                          },
                          onComplete: (value) {
                            if (!(value ?? false)) {
                              SnackbarApp.showSnackbar(
                                context,
                                msg: 'Access Denied',
                                type: SnackbarType.success,
                              );
                            } else {
                              _showOnCompleteDialog(
                                context,
                                data,
                                value ?? false,
                              );
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
