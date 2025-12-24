import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fire_todo/feature/auth/cubit/auth_cubit.dart';
import 'package:fire_todo/feature/auth/domain/models/models.dart';
import 'package:fire_todo/feature/auth/domain/services/services.dart';
import 'package:fire_todo/feature/auth/screens/screens.dart';
import 'package:fire_todo/feature/home/screens/screens.dart';
import 'package:fire_todo/feature/profile/cubit/profile_cubit.dart';
import 'package:fire_todo/feature/profile/domain/services/services.dart';
import 'package:fire_todo/feature/todo/cubit/todo_cubit.dart';
import 'package:fire_todo/feature/todo/domain/models/models.dart';
import 'package:fire_todo/feature/todo/domain/services/services.dart';
import 'package:fire_todo/hive/boxes.dart';
import 'package:fire_todo/hive/profile_hive.dart';
import 'package:fire_todo/routes/routes.dart';
import 'package:fire_todo/services/services.dart';
import 'package:fire_todo/storage/storage.dart';

//* Mock class
class MockAuthRepository extends Mock implements AuthRepository {}

class MockProfileRepository extends Mock implements ProfileRepository {}

class MockTodoRepository extends Mock implements TodoRepository {}

class MockHiveRepository extends Mock implements HiveRepository {}

class MockHiveController extends Mock implements HiveController {}

class MockStorageTokenRepository extends Mock
    implements StorageTokenRepository {}

class MockHiveBox extends Mock implements Box<ProfileHive> {}

class ModularNavigateMock extends Mock implements IModularNavigator {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AuthCubit mockAuthCubit;
  late ProfileCubit mockProfileCubit;
  late TodoCubit mockTodoCubit;
  late AuthRepository mockRepository;
  late ProfileRepository mockProfileRepository;
  late TodoRepository mockTodoRepository;
  late IModularNavigator navigator;
  late HiveRepository mockHiveRepository;
  late Box<ProfileHive> mockHiveBox;
  late StorageTokenRepository mockStorageRepository;

  const logoApp = Key('logoApp');
  const welcomeBack = Key('welcomeBack');
  const emailField = Key('emailField');
  const passwordField = Key('passwordField');
  const buttonLogin = Key('buttonLogin');
  const buttonSignUp = Key('buttonSignUp');
  const emailValid = 'usertesting1@gmail.com';
  const passValid = 'P@ssw0rd';
  const loaderKey = LoaderOverlay.defaultOverlayWidgetKey;

  setUp(() {
    mockAuthCubit = AuthCubit(
      authRepository: mockRepository,
      storageRepository: mockStorageRepository,
      hiveRepository: mockHiveRepository,
    );
    mockProfileCubit = ProfileCubit(
      profileRepository: mockProfileRepository,
      hiveRepository: mockHiveRepository,
      storageTokenRepository: mockStorageRepository,
    );
    mockTodoCubit = TodoCubit(
        todoRepository: mockTodoRepository, hiveRepository: mockHiveRepository);
    // authCubit.stream.listen((state) => debugPrint('Current state: $state'));
  });

  setUpAll(() async {
    //* Repo
    mockRepository = MockAuthRepository();
    mockProfileRepository = MockProfileRepository();
    mockHiveRepository = MockHiveRepository();
    mockTodoRepository = MockTodoRepository();
    mockStorageRepository = MockStorageTokenRepository();

    //* SharedPref
    SharedPreferences.setMockInitialValues({});

    //* Modular
    navigator = ModularNavigateMock();
    Modular.init(AppModule());
    Modular.navigatorDelegate = navigator;
    when(() => navigator.canPop()).thenReturn(true);
    when(() => navigator.pushNamed(any()))
        .thenAnswer((_) => Future.value(null));

    //* Hive
    await setUpTestHive();
    mockHiveBox = await Hive.openBox('PROFILE');
  });

  Widget homeWidgetTest(String value) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: mockAuthCubit),
        BlocProvider.value(value: mockProfileCubit),
        BlocProvider.value(value: mockTodoCubit),
      ],
      child: MaterialApp(
        home: GlobalLoaderOverlay(
            key: loaderKey,
            child: value.isEmpty
                ? const LoginScreen()
                : value.contains('home')
                    ? const MainScreen()
                    : const SignUpScreen()),
      ),
    );
  }

  group('LoginScreen', () {
    test('has a page', () {
      expect(const LoginScreen(), isA<LoginScreen>());
    });
    testWidgets('render LoginForm', (tester) async {
      await tester.pumpWidget(homeWidgetTest(''));

      expect(find.byKey(logoApp), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byKey(welcomeBack), findsOneWidget);
      expect(find.byKey(emailField), findsOneWidget);
      expect(find.byKey(passwordField), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byKey(buttonLogin), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byKey(buttonSignUp), findsOneWidget);
    });

    testWidgets('login flow then go to home', (tester) async {
      when(() => mockRepository.fetchLogin(emailValid, passValid))
          .thenAnswer((_) async => ResponseAPI.fromValue(const LoginModel()));
      when(() => mockTodoRepository.fetchListTodo()).thenAnswer((_) async {
        return ResponseAPI.fromValue(const ListTodoModel(documents: []));
      });

      await tester.pumpWidget(homeWidgetTest(''));

      final email = find.byKey(emailField);
      final pass = find.byKey(passwordField);
      final button = find.byKey(buttonLogin);

      expect(email, findsOneWidget);
      expect(pass, findsOneWidget);
      expect(button, findsOneWidget);

      // Isi kolom email dan password dengan data yang valid
      await tester.enterText(email, emailValid);
      await tester.enterText(pass, passValid);
      await tester.tap(button);
      await tester.pumpAndSettle();

      verify(() => mockRepository.fetchLogin(any(), any())).called(1);

      await tester.pumpWidget(homeWidgetTest('home'));

      expect(
          find.widgetWithText(NavigationDestination, 'Home'), findsOneWidget);
      expect(find.widgetWithText(NavigationDestination, 'Profile'),
          findsOneWidget);
    });

    testWidgets('Form validation fails if email or password is empty',
        (tester) async {
      // Arrange
      await tester.pumpWidget(homeWidgetTest(''));

      // Temukan kolom input
      final emailField = find.byType(TextField).at(0);
      final passwordField = find.byType(TextField).at(1);
      final loginButton = find.byType(ElevatedButton);

      // Isi kolom email dan password dengan teks kosong
      await tester.enterText(emailField, '');
      await tester.enterText(passwordField, '');
      await tester.tap(loginButton);
      await tester.pump();

      // Assert: Memastikan validasi menunjukkan kesalahan
      expect(find.text('Field is required'), findsNWidgets(2));
    });

    testWidgets('Form validation succeeds when valid data is entered',
        (tester) async {
      // Arrange
      await tester.pumpWidget(homeWidgetTest(''));

      // Temukan kolom input dan tombol login
      final emailField = find.byType(TextField).at(0);
      final passwordField = find.byType(TextField).at(1);
      final loginButton = find.byType(ElevatedButton);

      // Isi kolom email dan password dengan data yang valid
      await tester.enterText(emailField, emailValid);
      await tester.enterText(passwordField, passValid);
      await tester.tap(loginButton);
      await tester.pump();

      // Assert: Pastikan cubit login dipanggil dengan data yang benar
      verify(() => mockRepository.fetchLogin(any(), any())).called(1);
    });

    testWidgets('Navigates to Sign Up screen when "Sign Up" is tapped',
        (tester) async {
      // Arrange
      await tester.pumpWidget(homeWidgetTest(''));

      // Temukan dan tap pada link "Sign Up"
      final signUpLink = find.byKey(buttonSignUp);
      expect(signUpLink, findsOneWidget);
      await tester.tap(signUpLink);
      await tester.pumpAndSettle();

      await tester.pumpWidget(homeWidgetTest('sign up'));
      final text = find.text('Create Your Account');
      expect(text, findsOneWidget);

      verify(() => navigator.pushNamed('/auth/sign-up')).called(1);
    });
  });

  tearDown(() => mockAuthCubit.close());

  tearDownAll(() async {
    tearDownTestHive();
    mockHiveBox.close();
  });
}
