import 'package:hive/hive.dart';

import '../domain/i_hive_repository.dart';
import '../domain/models/profile_hive.dart';

class HiveRepositoryImpl implements IHiveRepository {
  @override
  Box<ProfileHive> getProfile() {
    if (!Hive.isBoxOpen('PROFILE')) {
      throw Exception('Box "PROFILE" is not open.');
    }
    return Hive.box<ProfileHive>('PROFILE');
  }

  @override
  ProfileHive? getProfileValue() {
    return getProfile().values.firstOrNull;
  }

  @override
  Future<void> deleteProfile() async {
    var hasBox = getProfile().isNotEmpty;
    if (hasBox) {
      await getProfile().clear();
    }
  }
}
