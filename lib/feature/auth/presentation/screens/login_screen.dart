import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart' hide ModularStateX;
import 'package:gap/gap.dart';

import '../../../../app/app_paths.dart';
import '../../module/auth_paths.dart';
import '../../../../core/constant/color.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../core/helper/loading.dart';
import '../../../../core/widgets/button_primary.dart';
import '../../../../core/widgets/snackbar.dart';
import '../../../../core/widgets/svg.dart';
import '../../../../core/widgets/text.dart';
import '../../../../core/widgets/textformfield.dart';
import '../../../profile/presentation/cubit/profile_cubit.dart';
import '../cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  //* usertesting1@gmail.com P@ssw0rd

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => current.maybeWhen(
        loading: () => true,
        failed: (errorMessage) => true,
        authenticated: (response, token) => true,
        orElse: () => false,
      ),
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            LoadingHelper.showLoad(context);
          },
          authenticated: (response, token) {
            context.read<ProfileCubit>().getUser();
            Future.delayed(const Duration(milliseconds: 600), () {
              if (context.mounted) {
                context.navigate(AppPaths.main);
                LoadingHelper.hideLoad(context);
              }
            });
          },
          failed: (errorMessage) {
            LoadingHelper.hideLoad(context);
            SnackbarApp.showSnackbar(
              context,
              msg: errorMessage,
              type: SnackbarType.failed,
            );
          },
          orElse: () => LoadingHelper.hideLoad(context),
        );
      },
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(Assets.images.imgBgLogin.path)),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(20),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                      child: SvgApp(
                        key: const Key('logoApp'),
                        assetName: Assets.icons.logo,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            const Gap(16),
                            const Center(
                              child: TextApp(
                                key: Key('welcomeBack'),
                                text: 'Welcome Back!',
                                size: FontAppSize.font_20,
                                weight: FontAppWeight.bold,
                                color: ColorApp.white,
                              ),
                            ),
                            const Gap(16),
                            TextFormFieldApp(
                              key: const Key('emailField'),
                              filled: true,
                              filledColor: ColorApp.white,
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: Icon(
                                Icons.email,
                                color: ColorApp.primary2(50),
                              ),
                              textInputAction: TextInputAction.next,
                              borderRadius: 12,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Field is required';
                                }
                                final emailRegExp = RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                );
                                if (!emailRegExp.hasMatch(value)) {
                                  return 'Invalid email format';
                                }
                                return null;
                              },
                              hintText: 'email@example.com',
                            ),
                            const Gap(12),
                            TextFormFieldApp(
                              key: const Key('passwordField'),
                              controller: _passwordController,
                              filled: true,
                              filledColor: ColorApp.white,
                              prefixIcon: Icon(
                                Icons.lock_person,
                                color: ColorApp.primary2(50),
                              ),
                              borderRadius: 12,
                              obscure: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Field is required';
                                }
                                if (value.length < 6) {
                                  return 'Password must 6 characters';
                                }
                                return null;
                              },
                              hintText: '123456',
                            ),
                            const Gap(20),
                            ButtonPrimary(
                              radius: 20,
                              key: const Key('buttonLogin'),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().loginEmailPassword(
                                        email: _emailController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                      );
                                }
                              },
                              label: 'Login',
                            ),
                            const Gap(16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const TextApp(
                                  text: "Don't have an account ?",
                                  size: FontAppSize.font_14,
                                  color: ColorApp.white,
                                ),
                                const Gap(8),
                                InkWell(
                                  key: const Key('buttonSignUp'),
                                  onTap: () {
                                    context.pushNamed(AuthPaths.signUp);
                                  },
                                  child: const TextApp(
                                    text: 'Sign Up',
                                    size: FontAppSize.font_14,
                                    weight: FontAppWeight.bold,
                                    color: ColorApp.white,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
