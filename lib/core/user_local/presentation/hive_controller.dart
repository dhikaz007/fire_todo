import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_ce/hive.dart';

import '../domain/i_hive_repository.dart';
import '../domain/models/profile_hive.dart';

class HiveController extends ChangeNotifier implements Disposable {
  final IHiveRepository repository;

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
