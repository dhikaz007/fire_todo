import 'package:fire_todo/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:fire_todo/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:fire_todo/feature/auth/presentation/screens/screens.dart';
import 'package:fire_todo/feature/home/presentation/screens/screens.dart';
import 'package:fire_todo/feature/profile/data/repositories/profile_repository_impl.dart';
import 'package:fire_todo/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:fire_todo/feature/todo/domain/repositories/i_todo_repository.dart';
import 'package:fire_todo/feature/todo/presentation/cubit/todo_cubit.dart';
import 'package:fire_todo/core/user_local/domain/i_hive_repository.dart';
import 'package:fire_todo/core/user_local/domain/models/profile_hive.dart';
import 'package:fire_todo/core/user_local/presentation/hive_controller.dart';
import 'package:fire_todo/core/token_storage/domain/i_storage_token_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hive_ce_test/hive_ce_test.dart';
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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AuthCubit mockAuthCubit;
  late ProfileCubit mockProfileCubit;
  late TodoCubit mockTodoCubit;
  late AuthRepositoryImpl mockRepository;
  late ProfileRepositoryImpl mockProfileRepository;
  late ITodoRepository mockTodoRepository;
  late IHiveRepository mockHiveRepository;
  late Box<ProfileHive> mockHiveBox;
  late IStorageTokenRepository mockStorageRepository;

  const logoApp = Key('logoApp');
  const welcomeBack = Key('welcomeBack');
  const emailField = Key('emailField');
  const passwordField = Key('passwordField');
  const buttonLogin = Key('buttonLogin');
  const buttonSignUp = Key('buttonSignUp');

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
  });

  tearDown(() => mockAuthCubit.close());

  tearDownAll(() {
    tearDownTestHive();
    mockHiveBox.close();
  });
}
