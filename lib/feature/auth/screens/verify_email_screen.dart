part of 'screens.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  void _showDialog() {
    showAdaptiveDialog(
      barrierDismissible: false,
      barrierLabel: 'Success',
      context: context,
      builder: (context) => AlertDialog.adaptive(
        backgroundColor: ColorApp.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titlePadding: EdgeInsets.zero,
        title: Container(
          alignment: Alignment.center,
          width: 60,
          padding: const EdgeInsets.all(8),
          color: ColorApp.success(50).withAlpha(50),
          child: TextApp(
            text: 'Success',
            size: FontAppSize.font_16,
            weight: FontAppWeight.bold,
            color: ColorApp.success(50),
          ),
        ),
        content: const TextApp(
          text:
              'Verification link has been sent to your email to verify your account.',
          color: Colors.black,
          maxLines: 2,
          align: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ButtonPrimary(
            label: 'Close',
            onPressed: () {
              Navigator.of(context).pop();
              if (!context.mounted) return;
              Modular.to.navigate('/auth/');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModularListener<AuthCubit, AuthState>(
      listenWhen: (prev, curr) => curr.maybeWhen(
        loading: () => true,
        failed: (errorMessage) => true,
        verifyEmail: (response) => true,
        orElse: () => false,
      ),
      listener: (context, state) {
        state.maybeWhen(
          loading: () => LoadingHelper.showLoad(context),
          failed: (errorMessage) => SnackbarApp.showSnackbar(
            context,
            msg: errorMessage,
            type: SnackbarType.failed,
          ),
          verifyEmail: (response) => _showDialog(),
          orElse: () => LoadingHelper.hideLoad(context),
        );
      },
      child: Scaffold(
        backgroundColor: ColorApp.primary(10),
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(20),
              CircleAvatar(
                radius: 40,
                backgroundColor: ColorApp.primary(30),
                child: Icon(
                  size: 40,
                  Icons.check,
                  color: ColorApp.primary(50),
                ),
              ),
              const Gap(20),
              const Center(
                child: TextApp(
                  text: 'Account Created!',
                  size: FontAppSize.font_24,
                  weight: FontAppWeight.bold,
                ),
              ),
              const Gap(16),
              const Center(
                child: TextApp(
                  text: "Welcome to Fire Todo! Let's get you started",
                  size: FontAppSize.font_16,
                  weight: FontAppWeight.medium,
                ),
              ),
              const Gap(24),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: const BoxDecoration(
                    color: ColorApp.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Gap(40),
                      const Center(
                        child: TextApp(
                          text:
                              "We've sent a verification link to your email address. Please check your inbox to verify your account.",
                          size: FontAppSize.font_18,
                        ),
                      ),
                      const Gap(40),
                      ButtonPrimary(
                        radius: 24,
                        size: FontAppSize.font_16,
                        label: 'Send Verification Link',
                        onPressed: () {
                          context.read<AuthCubit>().verifyEmail();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
