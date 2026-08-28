import 'package:hive_ce/hive.dart';

import 'models/profile_hive.dart';

abstract class IHiveRepository {
  Box<ProfileHive> getProfile();
  ProfileHive? getProfileValue();
  Future<void> deleteProfile();
}
