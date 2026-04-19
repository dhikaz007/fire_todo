// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_hive.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class ProfileHiveAdapter extends TypeAdapter<ProfileHive> {
  @override
  final typeId = 0;

  @override
  ProfileHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileHive()
      ..localId = fields[0] as String
      ..email = fields[1] as String
      ..displayName = fields[2] as String
      ..passwordHash = fields[3] as String
      ..emailVerified = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, ProfileHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.localId)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.displayName)
      ..writeByte(3)
      ..write(obj.passwordHash)
      ..writeByte(4)
      ..write(obj.emailVerified);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
