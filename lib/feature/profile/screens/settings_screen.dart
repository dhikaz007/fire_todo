part of 'screens.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _showDeleteDialog(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: const TextApp(
          text: 'Delete all todo ?',
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
                    context.read<TodoCubit>().deleteAllTodo();
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

  @override
  Widget build(BuildContext context) {
    return ModularListener<TodoCubit, TodoState>(
      listener: (context, state) {
        debugPrint("$state");
        state.maybeWhen(
          loading: () => LoadingHelper.showLoad(context),
          deleteAll: (response) {
            LoadingHelper.hideLoad(context);
            SnackbarApp.showSnackbar(context,
                msg: response, type: SnackbarType.success);
            Modular.to.popAndPushNamed('/main');
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: ColorApp.primary(10),
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: kToolbarHeight),
                  child: NavigationToolbar(
                    leading: BackButton(
                      color: ColorApp.black,
                      onPressed: () {
                        Modular.to.maybePop();
                      },
                    ),
                    centerMiddle: true,
                    middle: const TextApp(
                      text: 'Settings',
                      size: FontAppSize.font_20,
                      weight: FontAppWeight.semiBold,
                    ),
                  ),
                ),
                const Gap(20),
                const TextApp(
                  text: 'Data Management',
                  size: FontAppSize.font_14,
                  color: ColorApp.textSecondary,
                ),
                const Gap(12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: ColorApp.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    visualDensity: VisualDensity.compact,
                    contentPadding: const EdgeInsets.all(0),
                    leading: Icon(
                      Icons.delete,
                      color: ColorApp.primary2(50),
                    ),
                    title: TextApp(
                      text: 'Delete All Todo',
                      size: FontAppSize.font_16,
                      weight: FontAppWeight.semiBold,
                      color: ColorApp.primary2(50),
                    ),
                    subtitle: const TextApp(
                      text: 'Permanently remove all tasks and lists',
                      size: FontAppSize.font_14,
                      color: ColorApp.textSecondary,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        _showDeleteDialog(context);
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                const TextApp(
                  text: 'Account',
                  size: FontAppSize.font_14,
                  color: ColorApp.textSecondary,
                ),
                const Gap(12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: ColorApp.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    visualDensity: VisualDensity.compact,
                    contentPadding: const EdgeInsets.all(0),
                    leading: Icon(
                      Icons.person_3,
                      color: ColorApp.primary2(50),
                    ),
                    title: TextApp(
                      text: 'Delete Account',
                      size: FontAppSize.font_16,
                      weight: FontAppWeight.semiBold,
                      color: ColorApp.primary2(50),
                    ),
                    subtitle: const TextApp(
                      text:
                          'This action is irreversible. All data will be lost.',
                      size: FontAppSize.font_14,
                      color: ColorApp.textSecondary,
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
