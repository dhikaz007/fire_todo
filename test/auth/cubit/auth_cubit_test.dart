import 'package:bloc_test/bloc_test.dart';
import 'package:fire_todo/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:fire_todo/feature/auth/domain/models/models.dart';
import 'package:fire_todo/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:fire_todo/shared/local_db/domain/i_hive_repository.dart';
import 'package:fire_todo/shared/local_db/domain/models/profile_hive.dart';
import 'package:fire_todo/shared/models/models.dart';
import 'package:fire_todo/shared/storage/domain/i_storage_token_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';

enum CallType { success, failed }

// //* Mock classes
class MockAuthRepository extends Mock implements AuthRepositoryImpl {}

class MockHiveService extends Mock implements IHiveRepository {}

class MockHiveBox extends Mock implements Box<ProfileHive> {}

class MockStorageTokenRepository extends Mock
    implements IStorageTokenRepository {}

class MockHiveRepository extends Mock implements IHiveRepository {}

void main() {
  late AuthCubit authCubit;
  late MockAuthRepository mockAuthRepo;
  late MockStorageTokenRepository mockStorageRepo;
  late MockHiveRepository mockHiveRepo;

  const emailValid = 'email@gmail.com';
  const passValid = '123456';

  setUp(() {
    mockAuthRepo = MockAuthRepository();
    mockStorageRepo = MockStorageTokenRepository();
    mockHiveRepo = MockHiveRepository();

    when(() => mockStorageRepo.setIdToken(any())).thenAnswer((_) async => {});
    when(() => mockStorageRepo.setRefreshToken(any()))
        .thenAnswer((_) async => {});
    when(() => mockStorageRepo.removeAllToken()).thenAnswer((_) async => {});
    when(() => mockHiveRepo.deleteProfile()).thenAnswer((_) async => {});

    authCubit = AuthCubit(
      iAuthRepository: mockAuthRepo,
      iStorageTokenRepository: mockStorageRepo,
      iHiveRepository: mockHiveRepo,
    );
  });

  group('AuthCubit - Full Test Suite', () {
    group('loginEmailPassword', () {
      blocTest<AuthCubit, AuthState>(
        'SUCCESS: login emits [loading, authenticated]',
        build: () => authCubit,
        setUp: () {
          when(() => mockAuthRepo.fetchLogin(any(), any())).thenAnswer(
            (_) async =>
                ResponseAPI.fromValue(const LoginModel(idToken: 'token123')),
          );
        },
        act: (cubit) =>
            cubit.loginEmailPassword(email: emailValid, password: passValid),
        expect: () => [
          const AuthState.loading(),
          isA<AuthState>().having(
              (s) =>
                  s.maybeMap(authenticated: (a) => a.token, orElse: () => null),
              'token',
              'token123'),
        ],
      );

      blocTest<AuthCubit, AuthState>(
        'FAILED: login emits [loading, failed]',
        build: () => authCubit,
        setUp: () => when(() => mockAuthRepo.fetchLogin(any(), any()))
            .thenThrow('Login Error'),
        act: (cubit) =>
            cubit.loginEmailPassword(email: emailValid, password: passValid),
        expect: () => [
          const AuthState.loading(),
          const AuthState.failed(errorMessage: 'Login Error')
        ],
      );
    });

    group('signUp', () {
      blocTest<AuthCubit, AuthState>(
        'SUCCESS: signUp emits [loading, signUp]',
        build: () => authCubit,
        setUp: () {
          when(() => mockAuthRepo.fetchSignUp(any(), any())).thenAnswer(
            (_) async =>
                ResponseAPI.fromValue(const SignUpModel(idToken: 'token123')),
          );
        },
        act: (cubit) => cubit.signUp(email: emailValid, password: passValid),
        expect: () => [
          const AuthState.loading(),
          isA<AuthState>().having(
              (s) => s.maybeMap(
                  signUp: (a) => a.response.idToken, orElse: () => null),
              'idToken',
              'token123'),
        ],
      );

      blocTest<AuthCubit, AuthState>(
        'FAILED: signUp emits [loading, failed]',
        build: () => authCubit,
        setUp: () => when(() => mockAuthRepo.fetchSignUp(any(), any()))
            .thenThrow('Signup Error'),
        act: (cubit) => cubit.signUp(email: emailValid, password: passValid),
        expect: () => [
          const AuthState.loading(),
          const AuthState.failed(errorMessage: 'Signup Error')
        ],
      );
    });

    group('verifyEmail', () {
      blocTest<AuthCubit, AuthState>(
        'SUCCESS: verifyEmail emits [loading, verifyEmail] & clears storage',
        build: () => authCubit,
        setUp: () {
          when(() => mockAuthRepo.fetchRequestEmailVerified()).thenAnswer(
            (_) async => ResponseAPI.fromValue(const RequestEmailModel()),
          );
        },
        act: (cubit) => cubit.verifyEmail(),
        expect: () => [
          const AuthState.loading(),
          const AuthState.verifyEmail(),
        ],
        verify: (_) {
          verify(() => mockStorageRepo.removeAllToken()).called(1);
          verify(() => mockHiveRepo.deleteProfile()).called(1);
        },
      );
    });

    group('logout', () {
      blocTest<AuthCubit, AuthState>(
        'SUCCESS: logout emits [loading, logout]',
        build: () => authCubit,
        setUp: () =>
            when(() => mockAuthRepo.fetchLogout()).thenAnswer((_) async => {}),
        act: (cubit) => cubit.logout(),
        expect: () => [
          const AuthState.loading(),
          const AuthState.logout(),
        ],
      );
    });
  });

  tearDown(() => authCubit.close());
}

// void main() {
//   late AuthCubit mockCubit;
//   late AuthRepositoryImpl mockService;
//   late Box<ProfileHive> mockHiveBox;
//   late IStorageTokenRepository mockStorage;

//   late IHiveRepository mockHive;

//   const emailValid = 'email@mgmail.com';
//   const passValid = '123456';
//   const emailInvalid = 'invalid';
//   const passInvalid = 'invalid';

//   setUp(() {
//     mockService = MockAuthServices();
//     mockStorage = MockStorageTokenRepository();
//     mockHive = MockHiveRepository();
//     Modular.replaceInstance<IStorageTokenRepository>(mockStorage);

//     when(() => mockStorage.setIdToken(any())).thenAnswer((_) async => {});
//     when(() => mockStorage.setRefreshToken(any())).thenAnswer((_) async => {});
//     when(() => mockStorage.removeAllToken()).thenAnswer((_) async => {});
//     when(() => mockHive.deleteProfile()).thenAnswer((_) async => {});

//     mockCubit = AuthCubit(
//       iAuthRepository: mockService,
//       iStorageTokenRepository: mockStorage,
//       iHiveRepository: mockHive,
//     );
//     mockCubit.stream.listen((state) => debugPrint('Current state: $state'));
//   });

//   setUpAll(() async {
//     SharedPreferences.setMockInitialValues({});
//     await setUpTestHive();
//     mockHiveBox = await Hive.openBox('PROFILE');
//   });

//   void setUpRepoLogin(CallType value) {
//     switch (value) {
//       case CallType.failed:
//         when(() => mockService.fetchLogin(any(), any()))
//             .thenThrow(const ErrorResponseModel());
//         break;
//       case CallType.success:
//         when(() => mockService.fetchLogin(any(), any()))
//             .thenAnswer((_) async => ResponseAPI.fromValue(const LoginModel()));
//         break;
//     }
//   }

//   void setUpRepoSignUp(CallType value) {
//     switch (value) {
//       case CallType.success:
//         when(() => mockService.fetchSignUp(any(), any())).thenAnswer(
//             (_) async => ResponseAPI.fromValue(const SignUpModel()));
//         break;
//       case CallType.failed:
//         when(() => mockService.fetchSignUp(any(), any()))
//             .thenThrow(const ErrorResponseModel());
//         break;
//     }
//   }

//   void setUpRepoVerifyEmail(CallType value) {
//     switch (value) {
//       case CallType.success:
//         when(() => mockService.fetchRequestEmailVerified()).thenAnswer(
//             (_) async => ResponseAPI.fromValue(const RequestEmailModel()));
//         break;
//       case CallType.failed:
//         when(() => mockService.fetchRequestEmailVerified())
//             .thenThrow(const ErrorResponseModel());
//         break;
//     }
//   }

//   void setUpRepoLogout(CallType value) {
//     switch (value) {
//       case CallType.success:
//         when(() => mockService.fetchLogout()).thenAnswer((_) async => {});
//         break;
//       case CallType.failed:
//         when(() => mockService.fetchLogout())
//             .thenThrow(const ErrorResponseModel());
//         break;
//     }
//   }

//   group('AuthCubit', () {
//     test('initial state is AuthInitial', () {
//       expect(
//           mockCubit.state,
//           isA<AuthState>().having(
//             (e) => e,
//             'is initial',
//             const AuthState.initial(),
//           ));
//     });

//     group('loginEmailPassword', () {
//       test(
//         'emits AuthSuccess on successful login',
//         () async {
//           // Arrange
//           setUpRepoLogin(CallType.success);

//           // Assert
//           expectLater(
//             mockCubit.stream,
//             emitsInOrder([
//               isA<AuthState>()
//                   .having((e) => e, 'is Loading', const AuthState.loading()),
//               isA<AuthState>().having((e) => e, 'is Authenticated',
//                   const AuthState.authenticated()),
//             ]),
//           );

//           // Act
//           mockCubit.loginEmailPassword(
//             email: 'usertesting1@gmail.com',
//             password: 'P@ssw0rd',
//           );
//         },
//       );

//       blocTest(
//         'loginEmailPasswordCubit with AuthSuccess',
//         build: () => mockCubit,
//         setUp: () => setUpRepoLogin(CallType.success),
//         act: (bloc) =>
//             bloc.loginEmailPassword(email: emailValid, password: passValid),
//         expect: () => [
//           isA<AuthState>()
//               .having((e) => e, 'is Loading', const AuthState.loading()),
//           isA<AuthState>().having(
//               (e) => e, 'is Authenticated', const AuthState.authenticated()),
//         ],
//         verify: (_) =>
//             verify(() => mockService.fetchLogin(any(), any())).called(1),
//       );

//       test('emits AuthFailed on failed login', () async {
//         // Arrange
//         setUpRepoLogin(CallType.failed);

//         // Assert
//         expectLater(
//           mockCubit.stream,
//           emitsInOrder([
//             isA<AuthState>()
//                 .having((e) => e, 'is Loading', const AuthState.loading()),
//             isA<AuthState>()
//                 .having((e) => e, 'is Failed', const AuthState.failed()),
//           ]),
//         );

//         // Act
//         mockCubit.loginEmailPassword(
//             email: 'test@example.com', password: 'wrongPassword');
//       });

//       blocTest(
//         'loginEmailPasswordCubit with AuthFailed',
//         build: () => mockCubit,
//         setUp: () => setUpRepoLogin(CallType.failed),
//         act: (bloc) =>
//             bloc.loginEmailPassword(email: emailInvalid, password: passInvalid),
//         expect: () => [
//           isA<AuthState>()
//               .having((e) => e, 'is Loading', const AuthState.loading()),
//           isA<AuthState>()
//               .having((e) => e, 'is Failed', const AuthState.failed()),
//         ],
//         verify: (_) =>
//             verify(() => mockService.fetchLogin(any(), any())).called(1),
//       );
//     });

//     group('logout', () {
//       test('emits  AuthLogout on successful logout', () async {
//         // Arrange
//         setUpRepoLogout(CallType.success);

//         // Assert
//         expectLater(
//           mockCubit.stream,
//           emitsInOrder([
//             isA<AuthState>()
//                 .having((e) => e, 'is Loading', const AuthState.loading()),
//             isA<AuthState>()
//                 .having((e) => e, 'is Logout', const AuthState.logout()),
//           ]),
//         );

//         // Act
//         mockCubit.logout();
//       });

//       blocTest(
//         'logoutCubit with AuthLogout',
//         build: () => mockCubit,
//         setUp: () => setUpRepoLogout(CallType.success),
//         act: (bloc) => bloc.logout(),
//         expect: () => [
//           isA<AuthState>()
//               .having((e) => e, 'is Loading', const AuthState.loading()),
//           isA<AuthState>()
//               .having((e) => e, 'is Logout', const AuthState.logout()),
//         ],
//         verify: (_) => verify(() => mockService.fetchLogout()).called(1),
//       );

//       test('emits  AuthFailed on failed logout', () async {
//         // Arrange
//         setUpRepoLogout(CallType.failed);

//         // Assert
//         expectLater(
//           mockCubit.stream,
//           emitsInOrder([
//             isA<AuthState>()
//                 .having((e) => e, 'is Loading', const AuthState.loading()),
//             isA<AuthState>()
//                 .having((e) => e, 'is Failed', const AuthState.failed()),
//           ]),
//         );

//         // Act
//         mockCubit.logout();
//       });

//       blocTest(
//         'logoutCubit with AuthFailed',
//         build: () => mockCubit,
//         setUp: () => setUpRepoLogout(CallType.failed),
//         act: (bloc) => bloc.logout(),
//         expect: () => [
//           isA<AuthState>()
//               .having((e) => e, 'is Loading', const AuthState.loading()),
//           isA<AuthState>()
//               .having((e) => e, 'is Failed', const AuthState.failed()),
//         ],
//         verify: (_) => verify(() => mockService.fetchLogout()).called(1),
//       );
//     });

//     group('signUp', () {
//       test('emits AuthSignUp on successful sign up', () async {
//         // Arrange
//         setUpRepoSignUp(CallType.success);

//         // Assert
//         expectLater(
//           mockCubit.stream,
//           emitsInOrder([
//             isA<AuthState>()
//                 .having((e) => e, 'is Loading', const AuthState.loading()),
//             isA<AuthState>()
//                 .having((e) => e, 'is SignUp', const AuthState.signUp()),
//           ]),
//         );

//         // Act
//         mockCubit.signUp(email: 'test@example.com', password: 'password');
//       });

//       blocTest(
//         'signUpCubit with AuthSignUp',
//         build: () => mockCubit,
//         setUp: () => setUpRepoSignUp(CallType.success),
//         act: (bloc) => bloc.signUp(email: emailValid, password: passValid),
//         expect: () => [
//           isA<AuthState>()
//               .having((e) => e, 'is Loading', const AuthState.loading()),
//           isA<AuthState>()
//               .having((e) => e, 'is SignUp', const AuthState.signUp()),
//         ],
//         verify: (_) =>
//             verify(() => mockService.fetchSignUp(any(), any())).called(1),
//       );

//       test('emits AuthFailed on failed sign up', () async {
//         // Arrange
//         setUpRepoSignUp(CallType.failed);

//         // Assert
//         expectLater(
//             mockCubit.stream,
//             emitsInOrder([
//               isA<AuthState>()
//                   .having((e) => e, 'is Loading', const AuthState.loading()),
//               isA<AuthState>()
//                   .having((e) => e, 'is Failed', const AuthState.failed()),
//             ]));

//         // Act
//         mockCubit.signUp(email: 'test@example.com', password: 'password');
//       });

//       blocTest(
//         'signUpCubit emit AuthFailed',
//         build: () => mockCubit,
//         setUp: () => setUpRepoSignUp(CallType.failed),
//         act: (bloc) => bloc.signUp(email: emailValid, password: passValid),
//         expect: () => [
//           isA<AuthState>()
//               .having((e) => e, 'is Loading', const AuthState.loading()),
//           isA<AuthState>()
//               .having((e) => e, 'is Failed', const AuthState.failed()),
//         ],
//         verify: (_) =>
//             verify(() => mockService.fetchSignUp(any(), any())).called(1),
//       );
//     });

//     group('verifyEmail', () {
//       test('emits  AuthVerifyEmail on successful email verification', () async {
//         // Arrange
//         setUpRepoVerifyEmail(CallType.success);

//         // Assert
//         expectLater(
//           mockCubit.stream,
//           emitsInOrder([
//             isA<AuthState>()
//                 .having((e) => e, 'is Loading', const AuthState.loading()),
//             isA<AuthState>().having(
//                 (e) => e, 'is VerifyEmail', const AuthState.verifyEmail()),
//           ]),
//         );

//         // Act
//         mockCubit.verifyEmail();
//       });

//       blocTest(
//         'verifyEmailCubit with emit AuthVerify',
//         build: () => mockCubit,
//         setUp: () => setUpRepoVerifyEmail(CallType.success),
//         act: (bloc) => bloc.verifyEmail(),
//         expect: () => [
//           isA<AuthState>()
//               .having((e) => e, 'is Loading', const AuthState.loading()),
//           isA<AuthState>().having(
//               (e) => e, 'is VerifyEmail', const AuthState.verifyEmail()),
//         ],
//         verify: (_) =>
//             verify(() => mockService.fetchRequestEmailVerified()).called(1),
//       );

//       test('emits AuthLoading and then AuthFailed on failed email verification',
//           () async {
//         // Arrange
//         setUpRepoVerifyEmail(CallType.failed);

//         // Assert
//         expectLater(
//             mockCubit.stream,
//             emitsInOrder([
//               isA<AuthState>()
//                   .having((e) => e, 'is Loading', const AuthState.loading()),
//               isA<AuthState>()
//                   .having((e) => e, 'is Failed', const AuthState.failed()),
//             ]));

//         // Act
//         mockCubit.verifyEmail();
//       });

//       blocTest(
//         'verifyEmailCubit with emit AutFailed',
//         build: () => mockCubit,
//         setUp: () => setUpRepoVerifyEmail(CallType.failed),
//         act: (bloc) => bloc.verifyEmail(),
//         expect: () => [
//           isA<AuthState>()
//               .having((e) => e, 'is Loading', const AuthState.loading()),
//           isA<AuthState>()
//               .having((e) => e, 'is Failed', const AuthState.failed()),
//         ],
//         verify: (_) =>
//             verify(() => mockService.fetchRequestEmailVerified()).called(1),
//       );
//     });
//   });

//   tearDown(() => mockCubit.close());

//   tearDownAll(() async {
//     tearDownTestHive();
//     mockHiveBox.close();
//   });
// }
