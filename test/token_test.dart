import 'package:fire_todo/shared/storage/domain/i_storage_token_repository.dart';
import 'package:fire_todo/shared/storage/presentation/storage_token_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStorageTokenRepository extends Mock
    implements IStorageTokenRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockStorageTokenRepository mockRepository;
  late StorageTokenController controller;

  setUp(() {
    debugPrint('\n--- Preparing for a new test... ---');

    mockRepository = MockStorageTokenRepository();

    when(() => mockRepository.getIdToken())
        .thenAnswer((_) => Future.value(null));
    when(() => mockRepository.getRefreshToken())
        .thenAnswer((_) => Future.value(null));

    controller = StorageTokenController(mockRepository);
  });

  tearDown(() {
    debugPrint('--- Test finished. ---');
  });

  group('StorageController Tests', () {
    test('should have null tokens initially if repository is empty', () async {
      await Future.microtask(() {});

      expect(controller.idToken, isNull);
      expect(controller.refreshToken, isNull);
      expect(controller.isLoading, false);

      verify(() => mockRepository.getIdToken()).called(1);
      verify(() => mockRepository.getRefreshToken()).called(1);
    });

    test('should save id token and reload state', () async {
      const newIdToken = 'new_id_token_789';

      when(() => mockRepository.setIdToken(newIdToken))
          .thenAnswer((_) async {});

      when(() => mockRepository.getIdToken())
          .thenAnswer((_) async => newIdToken);
      when(() => mockRepository.getRefreshToken())
          .thenAnswer((_) => Future.value(null));

      await controller.saveIdToken(newIdToken);

      verify(() => mockRepository.setIdToken(newIdToken)).called(1);

      expect(controller.idToken, newIdToken);
      expect(controller.refreshToken, isNull);
      expect(controller.isLoading, false);
    });

    test('should remove all tokens and reload state', () async {
      when(() => mockRepository.removeAllToken()).thenAnswer((_) async {});

      await controller.removeAllTokens();

      verify(() => mockRepository.removeAllToken()).called(1);

      expect(controller.idToken, isNull);
      expect(controller.refreshToken, isNull);
      expect(controller.isLoading, false);
    });
  });
}
