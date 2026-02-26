import 'package:bloc_test/bloc_test.dart';
import 'package:fire_todo/feature/auth/domain/models/models.dart';
import 'package:fire_todo/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:fire_todo/feature/auth/presentation/screens/screens.dart';
import 'package:fire_todo/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:fire_todo/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

class MockProfileCubit extends MockCubit<ProfileState>
    implements ProfileCubit {}

class MockModularNavigator extends Mock implements IModularNavigator {}

class TestModule extends Module {
  final AuthCubit authCubit;
  final ProfileCubit profileCubit;
  TestModule({
    required this.authCubit,
    required this.profileCubit,
  });

  @override
  void binds(Injector i) {
    i.addInstance<ProfileCubit>(profileCubit);
    i.addInstance<AuthCubit>(authCubit);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockAuthCubit mockAuthCubit;
  late MockProfileCubit mockProfileCubit;
  late MockModularNavigator mockModularNavigator;

  const loaderKey = LoaderOverlay.defaultOverlayWidgetKey;
  const emailMocked = "usertesting1@gmail.com";
  const passMocked = "P@ssw0rd";

  setUpAll(() {
    mockAuthCubit = MockAuthCubit();
    mockProfileCubit = MockProfileCubit();
    mockModularNavigator = MockModularNavigator();

    Modular.bindModule(
      TestModule(authCubit: mockAuthCubit, profileCubit: mockProfileCubit),
    );

    Modular.navigatorDelegate = mockModularNavigator;
  });

  tearDownAll(() {
    mockProfileCubit.close();
    mockAuthCubit.close();
    Modular.unbindModule();
    Modular.destroy();
  });

  Widget homeTestWidget(Widget child) {
    return GlobalLoaderOverlay(
      key: loaderKey,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  group('LoginScreen Widget Tests', () {
    testWidgets('should display all widgets correctly on initial load',
        (tester) async {
      whenListen(
        mockAuthCubit,
        Stream.fromIterable([const AuthState.initial()]),
        initialState: const AuthState.initial(),
      );
      await tester.pumpWidget(homeTestWidget(const LoginScreen()));

      // Assert: Periksa keberadaan widget dengan key
      expect(find.byKey(const Key('logoApp')), findsOneWidget);
      expect(find.byKey(const Key('welcomeBack')), findsOneWidget);
      expect(find.byKey(const Key('emailField')), findsOneWidget);
      expect(find.byKey(const Key('passwordField')), findsOneWidget);
      expect(find.byKey(const Key('buttonLogin')), findsOneWidget);
      expect(find.byKey(const Key('buttonSignUp')), findsOneWidget);

      final emailField =
          tester.widget<TextFormFieldApp>(find.byKey(const Key('emailField')));
      expect(emailField.controller?.text, emailMocked);
    });

    testWidgets('should call login and navigate on successful login',
        (tester) async {
      whenListen(
        mockAuthCubit,
        Stream.fromIterable([
          const AuthState.initial(),
          const AuthState.loading(),
          const AuthState.authenticated(response: LoginModel())
        ]),
        initialState: const AuthState.initial(),
      );
      when(() => mockProfileCubit.getUser()).thenAnswer((_) async {});
      when(() => mockModularNavigator.navigate('/main'))
          .thenAnswer((_) async {});

      await tester.pumpWidget(homeTestWidget(const LoginScreen()));
      await tester.pumpAndSettle();

      //* Sanity Check: Sekarang ini HARUS berhasil
      // final calledCubit = Modular.get<AuthCubit>();
      // final calledProfile = Modular.get<ProfileCubit>();
      // debugPrint('Cubit from Modular.get: ${calledCubit.runtimeType}');
      // debugPrint('Profile from Modular.get: ${calledProfile.runtimeType}');
      // debugPrint(
      //     'Is it the mock? ${calledCubit == mockAuthCubit} ${calledProfile == mockProfileCubit}');
      // expect(calledCubit, equals(mockAuthCubit));
      // expect(calledProfile, equals(mockProfileCubit));

      await tester.enterText(find.byKey(const Key('emailField')), emailMocked);
      await tester.enterText(
          find.byKey(const Key('passwordField')), passMocked);
      await tester.pump();

      await tester.tap(find.byKey(const Key('buttonLogin')));
      await tester.pumpAndSettle();

      verify(() => mockAuthCubit.loginEmailPassword(
          email: emailMocked, password: passMocked)).called(1);

      verify(() => mockProfileCubit.getUser()).called(1);
      verify(() => mockModularNavigator.navigate('/main')).called(1);
    });
    testWidgets('should show error message on failed login', (tester) async {
      const errorMessage = 'Invalid credentials';
      whenListen(
        mockAuthCubit,
        Stream.fromIterable([
          const AuthState.initial(),
          const AuthState.loading(),
          const AuthState.failed(errorMessage: errorMessage)
        ]),
        initialState: const AuthState.initial(),
      );

      await tester.pumpWidget(homeTestWidget(const LoginScreen()));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('emailField')), emailMocked);
      await tester.enterText(
          find.byKey(const Key('passwordField')), passMocked);
      await tester.pump();

      await tester.tap(find.byKey(const Key('buttonLogin')));

      await tester.pump(); // Proses tap
      await tester.pump(); // Rebuild
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byKey(const ValueKey('snackbarWidgetText')), findsOneWidget);
      expect(find.text(errorMessage), findsOneWidget);

      await tester.pumpAndSettle();

      verify(() => mockAuthCubit.loginEmailPassword(
            email: emailMocked,
            password: passMocked,
          )).called(1);

      verifyNever(() => mockModularNavigator.navigate('/main'));
    });

    testWidgets('should show validation errors when form is submitted empty',
        (tester) async {
      whenListen(
        mockAuthCubit,
        Stream.fromIterable([
          const AuthState.initial(),
        ]),
        initialState: const AuthState.initial(),
      );

      await tester.pumpWidget(homeTestWidget(const LoginScreen()));
      await tester.pumpAndSettle();

      final emailField = find.byKey(const Key('emailField'));
      final passwordField = find.byKey(const Key('passwordField'));

      await tester.enterText(emailField, '');
      await tester.enterText(passwordField, '');

      await tester.tap(find.byKey(const Key('buttonLogin')));
      await tester.pump();

      expect(find.text('Field is required'), findsNWidgets(2));
    });
  });
}
