import 'package:flutter_modular/flutter_modular.dart';

import '../shared/local_db/data/hive_repository_impl.dart';
import '../shared/local_db/domain/i_hive_repository.dart';
import '../shared/local_db/presentation/hive_controller.dart';
import '../shared/network/dio_client.dart';
import '../shared/storage/data/storage_token_repository_impl.dart';
import '../shared/storage/domain/i_storage_token_repository.dart';
import '../shared/storage/presentation/storage_token_controller.dart';

abstract class IAppNavigationRepository {
  void navigateToLoginAndClearStack();
}

class AppNavigationRepositoryImpl implements IAppNavigationRepository {
  @override
  void navigateToLoginAndClearStack() {
    Modular.to.pushNamedAndRemoveUntil('/login', (route) => false);
  }
}

class ServicesModule extends Module {
  @override
  void exportedBinds(i) {
    i.addLazySingleton(DioClient.new);
    i.addLazySingleton<IAppNavigationRepository>(
        AppNavigationRepositoryImpl.new);

    i.addLazySingleton<IStorageTokenRepository>(StorageTokenRepositoryImpl.new);
    i.addSingleton<StorageTokenController>(StorageTokenController.new);

    i.addLazySingleton<IHiveRepository>(HiveRepositoryImpl.new);
    i.addSingleton<HiveController>(HiveController.new);
    super.exportedBinds(i);
  }
}
