import 'package:bloc_test/bloc_test.dart';
import 'package:fire_todo/feature/auth/presentation/screens/screens.dart';
import 'package:fire_todo/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:fire_todo/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProfileCubit extends MockCubit<ProfileState>
    implements ProfileCubit {}

class MockProfileState extends Mock implements ProfileState {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockProfileCubit mockProfileCubit;

  setUp(() {
    registerFallbackValue(MockProfileState());
    mockProfileCubit = MockProfileCubit();
  });

  tearDown(() {
    mockProfileCubit.close();
  });

  group('SplashScreen test =>', () {
    testWidgets('render splash screen', (tester) async {
      when(() => mockProfileCubit.getUser()).thenAnswer((_) {});

      // v7: Simple widget test without ModularApp wrapper
      await tester.pumpWidget(
        const MaterialApp(
          home: SplashScreen(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.widgetWithText(TextApp, 'Fire'), findsOneWidget);
      expect(find.widgetWithText(TextApp, 'Todo'), findsOneWidget);

      debugPrint('✅ Test passed: render splash screen');
    });
  });
}
