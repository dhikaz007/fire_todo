import 'package:bloc_test/bloc_test.dart';
import 'package:fire_todo/feature/auth/cubit/auth_cubit.dart';
import 'package:fire_todo/feature/auth/domain/models/models.dart';
import 'package:fire_todo/feature/auth/domain/services/services.dart';
import 'package:fire_todo/hive/boxes.dart';
import 'package:fire_todo/hive/profile_hive.dart';
import 'package:fire_todo/services/services.dart';
import 'package:fire_todo/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum CallType { success, failed }

//* Mock classes
class MockAuthServices extends Mock implements AuthServices {}

class MockHiveService extends Mock implements HiveService {}

class MockHiveBox extends Mock implements Box<ProfileHive> {}

class MockStorageTokenRepository extends Mock
    implements StorageTokenRepository {}

class MockHiveRepository extends Mock implements HiveRepository {}

void main() {
  late AuthCubit mockCubit;
  late AuthServices mockService;
  late Box<ProfileHive> mockHiveBox;
  late StorageTokenRepository mockStorage;

  late HiveRepository mockHive;

  const emailValid = 'email@mgmail.com';
  const passValid = '123456';
  const emailInvalid = 'invalid';
  const passInvalid = 'invalid';

  setUp(() {
    mockService = MockAuthServices();
    mockStorage = MockStorageTokenRepository();
    mockHive = MockHiveRepository();
    Modular.replaceInstance<StorageTokenRepository>(mockStorage);

    mockCubit = AuthCubit(
      authRepository: mockService,
      storageRepository: mockStorage,
      hiveRepository: mockHive,
    );
    mockCubit.stream.listen((state) => debugPrint('Current state: $state'));
  });

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await setUpTestHive();
    mockHiveBox = await Hive.openBox('PROFILE');
  });

  void setUpRepoLogin(CallType value) {
    switch (value) {
      case CallType.failed:
        when(() => mockService.fetchLogin(any(), any()))
            .thenThrow(const ErrorResponseModel());
        break;
      case CallType.success:
        when(() => mockService.fetchLogin(any(), any()))
            .thenAnswer((_) async => ResponseAPI.fromValue(const LoginModel()));
        break;
    }
  }

  void setUpRepoSignUp(CallType value) {
    switch (value) {
      case CallType.success:
        when(() => mockService.fetchSignUp(any(), any())).thenAnswer(
            (_) async => ResponseAPI.fromValue(const SignUpModel()));
        break;
      case CallType.failed:
        when(() => mockService.fetchSignUp(any(), any()))
            .thenThrow(const ErrorResponseModel());
        break;
    }
  }

  void setUpRepoVerifyEmail(CallType value) {
    switch (value) {
      case CallType.success:
        when(() => mockService.fetchRequestEmailVerified()).thenAnswer(
            (_) async => ResponseAPI.fromValue(const RequestEmailModel()));
        break;
      case CallType.failed:
        when(() => mockService.fetchRequestEmailVerified())
            .thenThrow(const ErrorResponseModel());
        break;
    }
  }

  void setUpRepoLogout(CallType value) {
    switch (value) {
      case CallType.success:
        when(() => mockService.fetchLogout()).thenAnswer((_) async => {});
        break;
      case CallType.failed:
        when(() => mockService.fetchLogout())
            .thenThrow(const ErrorResponseModel());
        break;
    }
  }

  group('AuthCubit', () {
    test('initial state is AuthInitial', () {
      expect(
          mockCubit.state,
          isA<AuthState>().having(
            (e) => e,
            'is initial',
            const AuthState.initial(),
          ));
    });

    group('loginEmailPassword', () {
      test(
        'emits AuthSuccess on successful login',
        () async {
          // Arrange
          setUpRepoLogin(CallType.success);

          // Assert
          expectLater(
            mockCubit.stream,
            emitsInOrder([
              isA<AuthState>()
                  .having((e) => e, 'is Loading', const AuthState.loading()),
              isA<AuthState>().having((e) => e, 'is Authenticated',
                  const AuthState.authenticated()),
            ]),
          );

          // Act
          mockCubit.loginEmailPassword(
            email: 'usertesting1@gmail.com',
            password: 'P@ssw0rd',
          );
        },
      );

      blocTest(
        'loginEmailPasswordCubit with AuthSuccess',
        build: () => mockCubit,
        setUp: () => setUpRepoLogin(CallType.success),
        act: (bloc) =>
            bloc.loginEmailPassword(email: emailValid, password: passValid),
        expect: () => [
          isA<AuthState>()
              .having((e) => e, 'is Loading', const AuthState.loading()),
          isA<AuthState>().having(
              (e) => e, 'is Authenticated', const AuthState.authenticated()),
        ],
        verify: (_) =>
            verify(() => mockService.fetchLogin(any(), any())).called(1),
      );

      test('emits AuthFailed on failed login', () async {
        // Arrange
        setUpRepoLogin(CallType.failed);

        // Assert
        expectLater(
          mockCubit.stream,
          emitsInOrder([
            isA<AuthState>()
                .having((e) => e, 'is Loading', const AuthState.loading()),
            isA<AuthState>()
                .having((e) => e, 'is Failed', const AuthState.failed()),
          ]),
        );

        // Act
        mockCubit.loginEmailPassword(
            email: 'test@example.com', password: 'wrongPassword');
      });

      blocTest(
        'loginEmailPasswordCubit with AuthFailed',
        build: () => mockCubit,
        setUp: () => setUpRepoLogin(CallType.failed),
        act: (bloc) =>
            bloc.loginEmailPassword(email: emailInvalid, password: passInvalid),
        expect: () => [
          isA<AuthState>()
              .having((e) => e, 'is Loading', const AuthState.loading()),
          isA<AuthState>()
              .having((e) => e, 'is Failed', const AuthState.failed()),
        ],
        verify: (_) =>
            verify(() => mockService.fetchLogin(any(), any())).called(1),
      );
    });

    group('logout', () {
      test('emits  AuthLogout on successful logout', () async {
        // Arrange
        setUpRepoLogout(CallType.success);

        // Assert
        expectLater(
          mockCubit.stream,
          emitsInOrder([
            isA<AuthState>()
                .having((e) => e, 'is Loading', const AuthState.loading()),
            isA<AuthState>()
                .having((e) => e, 'is Logout', const AuthState.logout()),
          ]),
        );

        // Act
        mockCubit.logout();
      });

      blocTest(
        'logoutCubit with AuthLogout',
        build: () => mockCubit,
        setUp: () => setUpRepoLogout(CallType.success),
        act: (bloc) => bloc.logout(),
        expect: () => [
          isA<AuthState>()
              .having((e) => e, 'is Loading', const AuthState.loading()),
          isA<AuthState>()
              .having((e) => e, 'is Logout', const AuthState.logout()),
        ],
        verify: (_) => verify(() => mockService.fetchLogout()).called(1),
      );

      test('emits  AuthFailed on failed logout', () async {
        // Arrange
        setUpRepoLogout(CallType.failed);

        // Assert
        expectLater(
          mockCubit.stream,
          emitsInOrder([
            isA<AuthState>()
                .having((e) => e, 'is Loading', const AuthState.loading()),
            isA<AuthState>()
                .having((e) => e, 'is Failed', const AuthState.failed()),
          ]),
        );

        // Act
        mockCubit.logout();
      });

      blocTest(
        'logoutCubit with AuthFailed',
        build: () => mockCubit,
        setUp: () => setUpRepoLogout(CallType.failed),
        act: (bloc) => bloc.logout(),
        expect: () => [
          isA<AuthState>()
              .having((e) => e, 'is Loading', const AuthState.loading()),
          isA<AuthState>()
              .having((e) => e, 'is Failed', const AuthState.failed()),
        ],
        verify: (_) => verify(() => mockService.fetchLogout()).called(1),
      );
    });

    group('signUp', () {
      test('emits AuthSignUp on successful sign up', () async {
        // Arrange
        setUpRepoSignUp(CallType.success);

        // Assert
        expectLater(
          mockCubit.stream,
          emitsInOrder([
            isA<AuthState>()
                .having((e) => e, 'is Loading', const AuthState.loading()),
            isA<AuthState>()
                .having((e) => e, 'is SignUp', const AuthState.signUp()),
          ]),
        );

        // Act
        mockCubit.signUp(email: 'test@example.com', password: 'password');
      });

      blocTest(
        'signUpCubit with AuthSignUp',
        build: () => mockCubit,
        setUp: () => setUpRepoSignUp(CallType.success),
        act: (bloc) => bloc.signUp(email: emailValid, password: passValid),
        expect: () => [
          isA<AuthState>()
              .having((e) => e, 'is Loading', const AuthState.loading()),
          isA<AuthState>()
              .having((e) => e, 'is SignUp', const AuthState.signUp()),
        ],
        verify: (_) =>
            verify(() => mockService.fetchSignUp(any(), any())).called(1),
      );

      test('emits AuthFailed on failed sign up', () async {
        // Arrange
        setUpRepoSignUp(CallType.failed);

        // Assert
        expectLater(
            mockCubit.stream,
            emitsInOrder([
              isA<AuthState>()
                  .having((e) => e, 'is Loading', const AuthState.loading()),
              isA<AuthState>()
                  .having((e) => e, 'is Failed', const AuthState.failed()),
            ]));

        // Act
        mockCubit.signUp(email: 'test@example.com', password: 'password');
      });

      blocTest(
        'signUpCubit emit AuthFailed',
        build: () => mockCubit,
        setUp: () => setUpRepoSignUp(CallType.failed),
        act: (bloc) => bloc.signUp(email: emailValid, password: passValid),
        expect: () => [
          isA<AuthState>()
              .having((e) => e, 'is Loading', const AuthState.loading()),
          isA<AuthState>()
              .having((e) => e, 'is Failed', const AuthState.failed()),
        ],
        verify: (_) =>
            verify(() => mockService.fetchSignUp(any(), any())).called(1),
      );
    });

    group('verifyEmail', () {
      test('emits  AuthVerifyEmail on successful email verification', () async {
        // Arrange
        setUpRepoVerifyEmail(CallType.success);

        // Assert
        expectLater(
          mockCubit.stream,
          emitsInOrder([
            isA<AuthState>()
                .having((e) => e, 'is Loading', const AuthState.loading()),
            isA<AuthState>().having(
                (e) => e, 'is VerifyEmail', const AuthState.verifyEmail()),
          ]),
        );

        // Act
        mockCubit.verifyEmail();
      });

      blocTest(
        'verifyEmailCubit with emit AuthVerify',
        build: () => mockCubit,
        setUp: () => setUpRepoVerifyEmail(CallType.success),
        act: (bloc) => bloc.verifyEmail(),
        expect: () => [
          isA<AuthState>()
              .having((e) => e, 'is Loading', const AuthState.loading()),
          isA<AuthState>().having(
              (e) => e, 'is VerifyEmail', const AuthState.verifyEmail()),
        ],
        verify: (_) =>
            verify(() => mockService.fetchRequestEmailVerified()).called(1),
      );

      test('emits AuthLoading and then AuthFailed on failed email verification',
          () async {
        // Arrange
        setUpRepoVerifyEmail(CallType.failed);

        // Assert
        expectLater(
            mockCubit.stream,
            emitsInOrder([
              isA<AuthState>()
                  .having((e) => e, 'is Loading', const AuthState.loading()),
              isA<AuthState>()
                  .having((e) => e, 'is Failed', const AuthState.failed()),
            ]));

        // Act
        mockCubit.verifyEmail();
      });

      blocTest(
        'verifyEmailCubit with emit AutFailed',
        build: () => mockCubit,
        setUp: () => setUpRepoVerifyEmail(CallType.failed),
        act: (bloc) => bloc.verifyEmail(),
        expect: () => [
          isA<AuthState>()
              .having((e) => e, 'is Loading', const AuthState.loading()),
          isA<AuthState>()
              .having((e) => e, 'is Failed', const AuthState.failed()),
        ],
        verify: (_) =>
            verify(() => mockService.fetchRequestEmailVerified()).called(1),
      );
    });
  });

  tearDown(() => mockCubit.close());

  tearDownAll(() async {
    tearDownTestHive();
    mockHiveBox.close();
  });
}
