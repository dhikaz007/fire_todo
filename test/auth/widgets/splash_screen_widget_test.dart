import 'package:bloc_test/bloc_test.dart';
import 'package:fire_todo/feature/auth/presentation/screens/screens.dart';
import 'package:fire_todo/feature/home/presentation/screens/screens.dart';
import 'package:fire_todo/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:fire_todo/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mocktail/mocktail.dart';

class MockProfileCubit extends MockCubit<ProfileState>
    implements ProfileCubit {}

class MockProfileState extends Mock implements ProfileState {}

class MockModularNavigator extends Mock implements IModularNavigator {}

class TestModule extends Module {
  final ProfileCubit profileCubit;

  TestModule({required this.profileCubit});

  @override
  void binds(Injector i) {
    i.addInstance<ProfileCubit>(profileCubit);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SplashScreen());
    r.child('/main', child: (_) => const MainScreen());
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockProfileCubit mockProfileCubit;
  late MockModularNavigator navigator;
  late Key loaderKey;

  setUp(() {
    registerFallbackValue(MockProfileState());
    mockProfileCubit = MockProfileCubit();
    loaderKey = LoaderOverlay.defaultOverlayWidgetKey;
    navigator = MockModularNavigator();
    Modular.navigatorDelegate = navigator;
  });

  tearDown(() {
    mockProfileCubit.close();
    Modular.unbindModule();
    Modular.destroy();
  });

  Widget homeWidgetTest() {
    return ModularApp(
      module: TestModule(profileCubit: mockProfileCubit),
      child: GlobalLoaderOverlay(
        key: loaderKey,
        child: MaterialApp.router(
          routerConfig: Modular.routerConfig,
        ),
      ),
    );
  }

  group('SplashScreen test =>', () {
    testWidgets('render splash screen', (tester) async {
      Modular.setInitialRoute('/');

      when(() => navigator.pushReplacementNamed('/main')).thenAnswer((_) async {
        debugPrint("Mock pushReplacementNamed '/main");
        return null;
      });

      await tester.pumpWidget(homeWidgetTest());
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.widgetWithText(TextApp, 'Fire'), findsOneWidget);
      expect(find.widgetWithText(TextApp, 'Todo'), findsOneWidget);

      verify(() => navigator.pushReplacementNamed('/main')).called(1);

      debugPrint('✅ Test passed: render splash screen');
    });

    testWidgets('Step by step debug splash screen', (tester) async {
      // Mock dengan detailed logging

      when(() => mockProfileCubit.getUser()).thenAnswer((_) {
        debugPrint('🟢 [STEP 3] Mock getUser() called');
      });
      when(() => navigator.pushReplacementNamed('/main')).thenAnswer((_) async {
        debugPrint('🟢 [STEP 3] Mock getUser() called');
        return null;
      });

      debugPrint('🔍 [STEP 0] Building widget...');
      await tester.pumpWidget(homeWidgetTest());

      debugPrint('🔍 [STEP 4] Widget built, starting pumps...');

      // Pump step by step untuk melihat proses
      await tester.pump(const Duration(milliseconds: 100));
      debugPrint('🔍 [STEP 5] After 100ms pump');

      await tester.pump(const Duration(milliseconds: 300));
      debugPrint('🔍 [STEP 6] After 300ms pump');

      await tester.pump(const Duration(milliseconds: 500));
      debugPrint('🔍 [STEP 7] After 500ms pump');

      await tester.pump(const Duration(milliseconds: 1000));
      debugPrint('🔍 [STEP 8] After 1000ms pump');

      await tester.pumpAndSettle();
      debugPrint('🔍 [STEP 9] After pumpAndSettle');

      try {
        verifyNever(() => mockProfileCubit.getUser());
        debugPrint('✅ [RESULT] getUser() was called');
      } catch (e) {
        debugPrint('❌ [ERROR] getUser() was NOT called: $e');
      }
    });
  });
}
