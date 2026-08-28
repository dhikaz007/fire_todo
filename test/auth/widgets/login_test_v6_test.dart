import 'package:bloc_test/bloc_test.dart';
import 'package:fire_todo/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:fire_todo/feature/auth/presentation/screens/screens.dart';
import 'package:fire_todo/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loader_overlay/loader_overlay.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

class MockProfileCubit extends MockCubit<ProfileState>
    implements ProfileCubit {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockAuthCubit mockAuthCubit;
  late MockProfileCubit mockProfileCubit;

  const loaderKey = LoaderOverlay.defaultOverlayWidgetKey;

  setUpAll(() {
    mockAuthCubit = MockAuthCubit();
    mockProfileCubit = MockProfileCubit();
  });

  tearDownAll(() {
    mockProfileCubit.close();
    mockAuthCubit.close();
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
