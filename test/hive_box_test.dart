import 'dart:async';

import 'package:fire_todo/shared/local_db/domain/i_hive_repository.dart';
import 'package:fire_todo/shared/local_db/domain/models/profile_hive.dart';
import 'package:fire_todo/shared/local_db/presentation/hive_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

class MockHiveRepository extends Mock implements IHiveRepository {}

class MockBox extends Mock implements Box<ProfileHive> {}

class MockStreamSubscription extends Mock
    implements StreamSubscription<BoxEvent> {}

class MockStream extends Mock implements Stream<BoxEvent> {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HiveController Tests', () {
    late MockHiveRepository mockRepository;
    late HiveController hiveController;
    late MockBox mockBox;
    late MockStreamSubscription mockSubscription;
    late MockStream mockStream;

    final testProfile = ProfileHive();
    final updatedProfile = ProfileHive();

    setUpAll(() {
      mockRepository = MockHiveRepository();
      mockBox = MockBox();
      mockSubscription = MockStreamSubscription();
      mockStream = MockStream();

      when(() => mockRepository.getProfile()).thenAnswer((_) => mockBox);

      when(() => mockBox.watch()).thenAnswer((_) => mockStream);

      when(() => mockStream.listen(any())).thenAnswer((_) => mockSubscription);

      when(() => mockSubscription.cancel()).thenAnswer((_) async {});

      when(() => mockRepository.getProfileValue())
          .thenAnswer((_) => testProfile);

      hiveController = HiveController(mockRepository);
    });

    test('should initialize with the correct profile from repository', () {
      expect(hiveController.profile, equals(testProfile));
      verify(() => mockRepository.getProfileValue()).called(1);
    });

    test('should update profile and notify listeners when box changes',
        () async {
      var notifyCallCount = 0;
      hiveController.addListener(() => notifyCallCount++);

      final captured = verify(() => mockStream.listen(captureAny())).captured;
      final listenCallback = captured.single as void Function(BoxEvent);

      when(() => mockRepository.getProfileValue()).thenReturn(updatedProfile);

      listenCallback(BoxEvent(0, updatedProfile, false));

      expect(hiveController.profile, equals(updatedProfile));
      expect(notifyCallCount, 1);
    });

    test('should call deleteProfile on repository when deleteProfile is called',
        () async {
      when(() => mockRepository.deleteProfile()).thenAnswer((_) async {});
      await hiveController.deleteProfile();
      verify(() => mockRepository.deleteProfile()).called(1);
    });

    test('should cancel stream subscription on dispose', () {
      hiveController.dispose();

      verify(() => mockSubscription.cancel()).called(1);
    });
  });
}
