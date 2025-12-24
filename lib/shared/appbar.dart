part of 'shared.dart';

class AppbarApp extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool canPop;
  final VoidCallback? callback;
  final List<Widget>? actions;
  final bool center;
  const AppbarApp({
    super.key,
    required this.title,
    this.canPop = true,
    this.callback,
    this.actions,
    this.center = false,
  });

  void _handlePop(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorApp.primary(50),
      actions: actions,
      centerTitle: center,
      title: TextApp(
        text: title,
        size: FontAppSize.font_18,
        weight: FontAppWeight.bold,
        color: ColorApp.white,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      leading: canPop
          ? IconButton(
              onPressed: callback ?? () => _handlePop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorApp.white,
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);
}
