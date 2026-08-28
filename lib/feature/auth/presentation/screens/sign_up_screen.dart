import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../module/auth_paths.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/helper/loading.dart';
import '../../../../core/widgets/button_primary.dart';
import '../../../../core/widgets/modular_listener.dart';
import '../../../../core/widgets/snackbar.dart';
import '../../../../core/widgets/svg.dart';
import '../../../../core/widgets/text.dart';
import '../../../../core/widgets/textformfield.dart';
import '../cubit/auth_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

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
    return ModularListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => current.maybeWhen(
        loading: () => true,
        failed: (errorMessage) => true,
        signUp: (response) => true,
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
          signUp: (response) {
            LoadingHelper.hideLoad(context);
            context.pushNamed(AuthPaths.verify);
          },
          orElse: () => LoadingHelper.hideLoad(context),
        );
      },
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(ImagesApp.imgBgSignUp),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: SafeArea(
            bottom: false,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: ColorApp.black,
                        size: 20,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Center(
                    child: SvgApp(
                      assetName: IconsApp.logo,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Gap(16),
                  const Center(
                    child: TextApp(
                      text: 'Create Your Account',
                      size: FontAppSize.font_20,
                      weight: FontAppWeight.bold,
                    ),
                  ),
                  const Gap(16),
                  TextFormFieldApp(
                    controller: _emailController,
                    filled: true,
                    filledColor: ColorApp.white,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email, color: ColorApp.primary(50)),
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
                    controller: _passwordController,
                    filled: true,
                    filledColor: ColorApp.white,
                    prefixIcon: Icon(
                      Icons.lock_person,
                      color: ColorApp.primary(50),
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
                    radius: 24,
                    size: FontAppSize.font_16,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().signUp(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                      }
                    },
                    label: 'Sign Up',
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
