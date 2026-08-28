import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../app/app_paths.dart';
import '../../../todo/module/todo_paths.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/helper/loading.dart';
import '../../../../core/token_storage/domain/i_storage_token_repository.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../profile/presentation/cubit/profile_cubit.dart';
import '../../../profile/presentation/screens/screens.dart';
import 'screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<int> _index = ValueNotifier<int>(0);
  final List<Widget> _pages = const [
    OverviewScreen(key: PageStorageKey('overview')),
    ProfileScreen(key: PageStorageKey('profile')),
  ];

  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getUser();
  }

  @override
  void dispose() {
    _index.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModularListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => LoadingHelper.showLoad(context),
          failed: (errorMessage) async {
            await inject<IStorageTokenRepository>().removeAllToken();
            if (!context.mounted) return;
            SnackbarApp.showSnackbar(context,
                msg: errorMessage, type: SnackbarType.failed);
            if (!context.mounted) return;
            LoadingHelper.hideLoad(context);
            context.replace(AppPaths.splash);
          },
          orElse: () => LoadingHelper.hideLoad(context),
        );
      },
      child: ValueListenableBuilder(
        valueListenable: _index,
        builder: (context, val, _) {
          return Scaffold(
            extendBody: true,
            backgroundColor: ColorApp.backgroundLight,
            body: PageStorage(
              bucket: _bucket,
              child: IndexedStack(
                index: val,
                children: _pages,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              key: const Key('navBarMain'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(300)),
              onPressed: () => context.pushNamed(TodoPaths.create),
              tooltip: 'Start Todo',
              elevation: 0,
              backgroundColor: ColorApp.primary(50),
              child: const Icon(Icons.note_alt_sharp, color: ColorApp.white),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
              child: BottomAppBar(
                color: ColorApp.primary(50),
                clipBehavior: Clip.hardEdge,
                elevation: 0,
                notchMargin: 8,
                shape: const CircularNotchedRectangle(),
                child: NavigationBar(
                  backgroundColor: ColorApp.primary(50),
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                  indicatorColor: ColorApp.backgroundLight,
                  selectedIndex: val,
                  onDestinationSelected: (value) => _index.value = value,
                  destinations: [
                    NavigationDestination(
                      icon: const Icon(Icons.home, color: ColorApp.black),
                      selectedIcon:
                          Icon(Icons.home, color: ColorApp.upcoming(50)),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: const Icon(Icons.person_4, color: ColorApp.black),
                      selectedIcon:
                          Icon(Icons.person_4, color: ColorApp.upcoming(50)),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
