import 'package:fire_todo/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:fire_todo/feature/auth/domain/models/models.dart';
import 'package:fire_todo/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:fire_todo/feature/auth/presentation/screens/screens.dart';
import 'package:fire_todo/feature/home/presentation/screens/screens.dart';
import 'package:fire_todo/feature/profile/data/repositories/profile_repository_impl.dart';
import 'package:fire_todo/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:fire_todo/feature/todo/domain/models/models.dart';
import 'package:fire_todo/feature/todo/domain/repositories/i_todo_repository.dart';
import 'package:fire_todo/feature/todo/presentation/cubit/todo_cubit.dart';
import 'package:fire_todo/routes/app_module.dart';
import 'package:fire_todo/shared/local_db/domain/i_hive_repository.dart';
import 'package:fire_todo/shared/local_db/domain/models/profile_hive.dart';
import 'package:fire_todo/shared/local_db/presentation/hive_controller.dart';
import 'package:fire_todo/shared/models/models.dart';
import 'package:fire_todo/shared/storage/domain/i_storage_token_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

//* Mock class
class MockAuthRepository extends Mock implements AuthRepositoryImpl {}

class MockProfileRepository extends Mock implements ProfileRepositoryImpl {}

class MockTodoRepository extends Mock implements ITodoRepository {}

class MockHiveRepository extends Mock implements IHiveRepository {}

class MockHiveController extends Mock implements HiveController {}

class MockStorageTokenRepository extends Mock
    implements IStorageTokenRepository {}

class MockHiveBox extends Mock implements Box<ProfileHive> {}

class ModularNavigateMock extends Mock implements IModularNavigator {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AuthCubit mockAuthCubit;
  late ProfileCubit mockProfileCubit;
  late TodoCubit mockTodoCubit;
  late AuthRepositoryImpl mockRepository;
  late ProfileRepositoryImpl mockProfileRepository;
  late ITodoRepository mockTodoRepository;
  late IModularNavigator navigator;
  late IHiveRepository mockHiveRepository;
  late Box<ProfileHive> mockHiveBox;
  late IStorageTokenRepository mockStorageRepository;

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
      iAuthRepository: mockRepository,
      iStorageTokenRepository: mockStorageRepository,
      iHiveRepository: mockHiveRepository,
    );
    mockProfileCubit = ProfileCubit(
      iProfileRepository: mockProfileRepository,
      iHiveRepository: mockHiveRepository,
      iStorageTokenRepository: mockStorageRepository,
    );
    mockTodoCubit = TodoCubit(iTodoRepository: mockTodoRepository);
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
    when(() => navigator.pushNamed(any())).thenAnswer((_) => Future.value());

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

  tearDownAll(() {
    tearDownTestHive();
    mockHiveBox.close();
  });
}
