import 'package:about/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../auth/module/auth_paths.dart';
import '../../module/profile_paths.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/helper/loading.dart';
import '../../../../core/user_local/domain/i_hive_repository.dart';
import '../../../../core/user_local/domain/models/profile_hive.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import 'widget/widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileHive? user;

  @override
  void initState() {
    super.initState();
    user = inject<IHiveRepository>().getProfileValue();
  }

  @override
  Widget build(BuildContext context) {
    return ModularListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () async {
            LoadingHelper.showLoad(context);
            await Future.delayed(const Duration(milliseconds: 500));
          },
          authenticated: (response, token) {},
          failed: (errorMessage) async {
            LoadingHelper.hideLoad(context);
            if (!context.mounted) return;
            await SnackbarApp.showSnackbar(
              context,
              msg: errorMessage,
              type: SnackbarType.failed,
            );
          },
          logout: () {
            SnackbarApp.showSnackbar(
              context,
              msg: 'Successfully Logout',
              type: SnackbarType.success,
            );
            context.navigate(AuthPaths.login);
            LoadingHelper.hideLoad(context);
          },
          signUp: (response) {},
          verifyEmail: (response) {},
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
                CircleAvatar(
                  backgroundColor: ColorApp.primary(50),
                  radius: 32,
                  child: TextApp(
                    text: user?.email[0] ?? '',
                    size: FontAppSize.font_18,
                    weight: FontAppWeight.bold,
                    color: ColorApp.white,
                  ),
                ),
                const Gap(12),
                if (user?.displayName != null) ...[
                  Center(
                    child: TextApp(
                      text: user?.displayName ?? '-',
                      size: FontAppSize.font_16,
                      weight: FontAppWeight.semiBold,
                    ),
                  ),
                  const Gap(8),
                ],
                Center(
                  child: TextApp(
                    text: user?.email ?? '-',
                    size: FontAppSize.font_14,
                    weight: FontAppWeight.medium,
                  ),
                ),
                const Gap(20),
                Container(
                  decoration: BoxDecoration(
                    color: ColorApp.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ProfileMenuItemWidget(
                          label: 'About',
                          onTap: () {
                            showAboutPage(
                              dialog: true,
                              context: context,
                              values: {
                                'version': '1.0',
                                'year': '2025',
                              },
                              applicationLegalese:
                                  'Copyright © Andhika, {{ year }}',
                              applicationDescription: const TextApp(
                                text:
                                    'A simple and powerful todo list application to manage your daily tasks. '
                                    'Built with speed and productivity in mind, allowing you to sync your tasks '
                                    'seamlessly across devices.',
                                size: FontAppSize.font_14,
                                weight: FontAppWeight.medium,
                              ),
                              children: [
                                const MarkdownPageListTile(
                                  icon: Icon(Icons.all_inclusive),
                                  title: TextApp(
                                    text: 'View Readme',
                                    size: FontAppSize.font_14,
                                  ),
                                  filename: 'assets/md/README.md',
                                ),
                                const MarkdownPageListTile(
                                  icon: Icon(Icons.view_list),
                                  title: TextApp(
                                    text: 'View Changelog',
                                    size: FontAppSize.font_14,
                                  ),
                                  filename: 'assets/md/CHANGELOG.md',
                                ),
                                const MarkdownPageListTile(
                                  icon: Icon(Icons.privacy_tip_outlined),
                                  title: TextApp(
                                    text: 'Privacy Policy',
                                    size: FontAppSize.font_14,
                                  ),
                                  filename: 'assets/md/PRIVACY_POLICY.md',
                                ),
                                const MarkdownPageListTile(
                                  filename: 'assets/md/LICENSE.md',
                                  title: TextApp(
                                    text: 'View License',
                                    size: FontAppSize.font_14,
                                  ),
                                  icon: Icon(Icons.description),
                                ),
                                const LicensesPageListTile(
                                  icon: Icon(Icons.info_outline),
                                  title: TextApp(
                                    text: 'Open Source Licenses',
                                    size: FontAppSize.font_14,
                                  ),
                                ),
                              ],
                              applicationIcon: const SizedBox(
                                width: 100,
                                height: 100,
                                child: Image(
                                  image: AssetImage(ImagesApp.logo),
                                ),
                              ),
                            );
                          },
                        ),
                        const Divider(height: 1),
                        ProfileMenuItemWidget(
                          label: 'Privacy Policy',
                          onTap: () {
                            context.pushNamed(ProfilePaths.privacy);
                          },
                        ),
                        const Divider(height: 1),
                        ProfileMenuItemWidget(
                          label: 'Settings',
                          onTap: () {
                            context.pushNamed(ProfilePaths.settings);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                ButtonPrimary(
                  size: FontAppSize.font_16,
                  radius: 24,
                  label: 'Log Out',
                  onPressed: () {
                    context.read<AuthCubit>().logout();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
