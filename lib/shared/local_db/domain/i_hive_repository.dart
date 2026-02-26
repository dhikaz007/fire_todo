import 'package:hive/hive.dart';

import 'models/profile_hive.dart';

abstract class IHiveRepository {
  Box<ProfileHive> getProfile();
  ProfileHive? getProfileValue();
  Future<void> deleteProfile();
}
