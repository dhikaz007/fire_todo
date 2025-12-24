import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import 'profile_hive.dart';

abstract class HiveRepository {
  Box<ProfileHive> getProfile();
  ProfileHive? getProfileValue();
  Future<void> deleteProfile();
}

class HiveService implements HiveRepository {
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

class HiveController extends ChangeNotifier implements Disposable {
  final HiveRepository repository;

  late final StreamSubscription<BoxEvent> _profileSubscription;
  ProfileHive? _profile;

  ProfileHive? get profile => _profile;

  HiveController(this.repository) {
    _loadProfile();
    _listenToProfileChanges();
  }

  void _loadProfile() {
    _profile = repository.getProfileValue();
  }

  void _listenToProfileChanges() {
    try {
      final box = repository.getProfile();

      _profileSubscription = box.watch().listen((event) {
        debugPrint(
            'Perubahan terdeteksi di Hive box: ${event.key.toString()}, ${event.value.toString()}');
        _loadProfile();
        notifyListeners();
      });
    } catch (e) {
      debugPrint('Gagal memulai listener pada Hive box: $e');
    }
  }

  Future<void> deleteProfile() async {
    await repository.deleteProfile();
  }

  @override
  void dispose() {
    debugPrint('Membuang HiveController...');
    _profileSubscription.cancel();
    super.dispose();
  }
}
