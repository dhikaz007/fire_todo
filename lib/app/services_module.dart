import 'package:flutter_modular/flutter_modular.dart';

import '../core/user_local/data/hive_repository_impl.dart';
import '../core/user_local/domain/i_hive_repository.dart';
import '../core/user_local/presentation/hive_controller.dart';
import '../core/network/dio_client.dart';
import '../core/token_storage/data/storage_token_repository_impl.dart';
import '../core/token_storage/domain/i_storage_token_repository.dart';
import '../core/token_storage/presentation/storage_token_controller.dart';

abstract class IAppNavigationRepository {
  void navigateToLoginAndClearStack();
}

class AppNavigationRepositoryImpl implements IAppNavigationRepository {
  @override
  void navigateToLoginAndClearStack() {
    // In v7, navigation requires a BuildContext.
    // This is called from DioClient interceptor which has no context.
    // We use a GlobalKey<NavigatorState> approach via ModularApp.
    // For now, this is handled differently - see DioClient._handleAuthError
  }
}

final servicesModule = createModule(
  register: (c) {
    c
      ..addLazySingleton(DioClient.new)
      ..addLazySingleton<IAppNavigationRepository>(
          AppNavigationRepositoryImpl.new)
      ..addLazySingleton<IStorageTokenRepository>(
          StorageTokenRepositoryImpl.new)
      ..addSingleton<StorageTokenController>(StorageTokenController.new)
      ..addLazySingleton<IHiveRepository>(HiveRepositoryImpl.new)
      ..addSingleton<HiveController>(HiveController.new);
  },
);
