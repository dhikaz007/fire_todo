import 'package:hive/hive.dart';

part 'profile_hive.g.dart';

@HiveType(typeId: 0)
class ProfileHive extends HiveObject {
  @HiveField(0)
  late String localId;
  @HiveField(1)
  late String email;
  @HiveField(2)
  late String displayName;
  @HiveField(3)
  late String passwordHash;
  @HiveField(4)
  bool emailVerified = false;
}
