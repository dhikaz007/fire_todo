import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fire_todo/feature/todo/presentation/screens/edit_todo_screen.dart';

void main() {
  group('EditTodoScreen', () {
    testWidgets('renders Scaffold with AppBar', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: EditTodoScreen(),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders SwitchListTile for isDone toggle', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: EditTodoScreen(),
        ),
      );

      expect(find.byType(SwitchListTile), findsOneWidget);
      expect(find.text('Already Done'), findsOneWidget);
    });

    testWidgets('toggles switch value when tapped', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: EditTodoScreen(),
        ),
      );

      final switchTile = find.byType(SwitchListTile);
      expect(switchTile, findsOneWidget);

      // Default value is false
      final switchWidget = tester.widget<SwitchListTile>(switchTile);
      expect(switchWidget.value, false);

      // Tap to toggle
      await tester.tap(find.byType(Switch));
      await tester.pump();

      // Value should be true now
      final switchWidgetAfter = tester.widget<SwitchListTile>(switchTile);
      expect(switchWidgetAfter.value, true);
    });

    testWidgets('has background color set', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: EditTodoScreen(),
        ),
      );

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, isNotNull);
    });
  });
}
