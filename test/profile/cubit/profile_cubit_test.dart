import 'package:bloc_test/bloc_test.dart';
import 'package:fire_todo/feature/profile/domain/repositories/i_profile_repository.dart';
import 'package:fire_todo/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:fire_todo/feature/profile/domain/models/user_model.dart';
import 'package:fire_todo/feature/profile/domain/models/delete_account_model.dart';
import 'package:fire_todo/feature/auth/domain/models/request_email_model.dart';
import 'package:fire_todo/core/user_local/domain/i_hive_repository.dart';
import 'package:fire_todo/core/user_local/domain/models/profile_hive.dart';
import 'package:fire_todo/core/models/models.dart';
import 'package:fire_todo/core/token_storage/domain/i_storage_token_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockProfileRepository extends Mock implements IProfileRepository {}

class MockHiveRepository extends Mock implements IHiveRepository {}

class MockHiveBox extends Mock implements Box<ProfileHive> {}

class MockStorageTokenRepository extends Mock
    implements IStorageTokenRepository {}

void main() {
  late ProfileCubit profileCubit;
  late MockProfileRepository mockProfileRepo;
  late MockHiveRepository mockHiveRepo;
  late MockStorageTokenRepository mockStorageRepo;
  late MockHiveBox mockHiveBox;

  setUpAll(() {
    registerFallbackValue(ProfileHive());
  });

  setUp(() {
    mockProfileRepo = MockProfileRepository();
    mockHiveRepo = MockHiveRepository();
    mockStorageRepo = MockStorageTokenRepository();
    mockHiveBox = MockHiveBox();

    when(() => mockHiveRepo.getProfile()).thenReturn(mockHiveBox);
    when(() => mockHiveRepo.deleteProfile()).thenAnswer((_) async {});
    when(() => mockStorageRepo.removeAllToken()).thenAnswer((_) async {});
    when(() => mockHiveBox.put(any(), any())).thenAnswer((_) async {});

    profileCubit = ProfileCubit(
      iProfileRepository: mockProfileRepo,
      iHiveRepository: mockHiveRepo,
      iStorageTokenRepository: mockStorageRepo,
    );
  });

  tearDown(() => profileCubit.close());

  group('ProfileCubit - Full Test Suite', () {
    group('getUser', () {
      blocTest<ProfileCubit, ProfileState>(
        'SUCCESS: getUser emits [loading, loaded] with user data',
        build: () => profileCubit,
        setUp: () {
          when(() => mockProfileRepo.fetchUser()).thenAnswer(
            (_) async => ResponseAPI.fromValue(
              const UserModel(
                kind: 'identitytoolkit#GetAccountInfoResponse',
                users: [
                  UserElementData(
                    localId: 'uid123',
                    email: 'test@example.com',
                    displayName: 'Test User',
                    emailVerified: true,
                  ),
                ],
              ),
            ),
          );
        },
        act: (cubit) => cubit.getUser(),
        expect: () => [
          const ProfileState.loading(),
          isA<ProfileState>().having(
            (s) => s.maybeMap(loaded: (a) => a.response.users?.firstOrNull?.email, orElse: () => null),
            'user email',
            'test@example.com',
          ),
        ],
        verify: (_) {
          verify(() => mockHiveBox.put(any(), any())).called(1);
        },
      );

      blocTest<ProfileCubit, ProfileState>(
        'SUCCESS: getUser emits [loading, loaded] when no users returned',
        build: () => profileCubit,
        setUp: () {
          when(() => mockProfileRepo.fetchUser()).thenAnswer(
            (_) async => ResponseAPI.fromValue(const UserModel()),
          );
        },
        act: (cubit) => cubit.getUser(),
        expect: () => [
          const ProfileState.loading(),
          isA<ProfileState>().having(
            (s) => s.maybeMap(loaded: (a) => a.response.users, orElse: () => null),
            'users',
            null,
          ),
        ],
      );

      blocTest<ProfileCubit, ProfileState>(
        'FAILED: getUser emits [loading, failed] on error',
        build: () => profileCubit,
        setUp: () => when(() => mockProfileRepo.fetchUser())
            .thenThrow(Exception('Network error')),
        act: (cubit) => cubit.getUser(),
        expect: () => [
          const ProfileState.loading(),
          isA<ProfileState>().having(
            (s) => s.maybeMap(failed: (a) => a.errorMessage, orElse: () => null),
            'error message',
            contains('Network error'),
          ),
        ],
      );
    });

    group('deleteAccount', () {
      blocTest<ProfileCubit, ProfileState>(
        'SUCCESS: deleteAccount emits [loading, delete] and clears storage',
        build: () => profileCubit,
        setUp: () {
          when(() => mockProfileRepo.fetchDeleteAccount()).thenAnswer(
            (_) async => ResponseAPI.fromValue(const DeleteAccountModel()),
          );
        },
        act: (cubit) => cubit.deleteAccount(),
        expect: () => [
          const ProfileState.loading(),
          isA<ProfileState>().having(
            (s) => s.maybeMap(delete: (_) => true, orElse: () => false),
            'is delete state',
            true,
          ),
        ],
        verify: (_) {
          verify(() => mockStorageRepo.removeAllToken()).called(1);
          verify(() => mockHiveRepo.deleteProfile()).called(1);
        },
      );

      blocTest<ProfileCubit, ProfileState>(
        'FAILED: deleteAccount emits [loading, failed] on error',
        build: () => profileCubit,
        setUp: () => when(() => mockProfileRepo.fetchDeleteAccount())
            .thenThrow(Exception('Delete failed')),
        act: (cubit) => cubit.deleteAccount(),
        expect: () => [
          const ProfileState.loading(),
          isA<ProfileState>().having(
            (s) => s.maybeMap(failed: (a) => a.errorMessage, orElse: () => null),
            'error message',
            contains('Delete failed'),
          ),
        ],
      );
    });

    group('resetPassword', () {
      blocTest<ProfileCubit, ProfileState>(
        'SUCCESS: resetPassword emits [loading, reset]',
        build: () => profileCubit,
        setUp: () {
          when(() => mockProfileRepo.fetchResetPassword(any())).thenAnswer(
            (_) async => ResponseAPI.fromValue(
              const RequestEmailModel(
                kind: 'identitytoolkit#GetOobConfirmationCodeResponse',
                email: 'test@example.com',
              ),
            ),
          );
        },
        act: (cubit) => cubit.resetPassword(email: 'test@example.com'),
        expect: () => [
          const ProfileState.loading(),
          isA<ProfileState>().having(
            (s) => s.maybeMap(reset: (a) => a.response.email, orElse: () => null),
            'reset email',
            'test@example.com',
          ),
        ],
      );

      blocTest<ProfileCubit, ProfileState>(
        'FAILED: resetPassword emits [loading, failed] on error',
        build: () => profileCubit,
        setUp: () => when(() => mockProfileRepo.fetchResetPassword(any()))
            .thenThrow(Exception('Reset failed')),
        act: (cubit) => cubit.resetPassword(email: 'test@example.com'),
        expect: () => [
          const ProfileState.loading(),
          isA<ProfileState>().having(
            (s) => s.maybeMap(failed: (a) => a.errorMessage, orElse: () => null),
            'error message',
            contains('Reset failed'),
          ),
        ],
      );
    });
  });
}
