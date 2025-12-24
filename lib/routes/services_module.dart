part of 'routes.dart';

abstract class AppNavigationService {
  void navigateToLoginAndClearStack();
}

class ModularNavigationService implements AppNavigationService {
  @override
  void navigateToLoginAndClearStack() {
    Modular.to.pushNamedAndRemoveUntil('/login', (route) => false);
  }
}

class ServicesModule extends Module {
  @override
  void exportedBinds(i) {
    i.add<AppNavigationService>(() => ModularNavigationService());

    i.add<StorageTokenRepository>(() => StorageTokenService());
    i.add<StorageTokenController>(
      () => StorageTokenController(i.get<StorageTokenRepository>()),
      config: BindConfig(onDispose: (value) => value.dispose),
    );

    i.add<HiveRepository>(() => HiveService());
    i.add<HiveController>(
      () => HiveController(i.get<HiveRepository>()),
      config: BindConfig(onDispose: (value) => value.dispose),
    );
    super.exportedBinds(i);
  }
}
