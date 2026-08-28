import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fire_todo/feature/todo/presentation/screens/detail_todo_screen.dart';
import 'package:fire_todo/feature/todo/domain/models/list_todo_model.dart';

void main() {
  group('DetailTodoScreen', () {
    late DocumentModel testDocument;

    setUp(() {
      testDocument = DocumentModel(
        name: 'projects/123/documents/456',
        fields: FieldsModel(
          title: const DescriptionValueModel(stringValue: 'Test Todo'),
          description: const DescriptionValueModel(stringValue: 'Test Description'),
          isDone: const IsDoneValueModel(booleanValue: false),
          dueDate: DueDateValueModel(
            timestampValue: DateTime(2025, 12, 25, 10, 30),
          ),
        ),
      );
    });

    testWidgets('renders Scaffold with AppBar', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DetailTodoScreen(document: testDocument),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('displays document title', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DetailTodoScreen(document: testDocument),
        ),
      );

      expect(find.text('Test Todo'), findsOneWidget);
    });

    testWidgets('displays document description', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DetailTodoScreen(document: testDocument),
        ),
      );

      expect(find.text('Test Description'), findsOneWidget);
    });

    testWidgets('displays isDone status', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DetailTodoScreen(document: testDocument),
        ),
      );

      expect(find.text('false'), findsOneWidget);
    });

    testWidgets('displays due date', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DetailTodoScreen(document: testDocument),
        ),
      );

      // The date should be displayed as ISO string
      expect(find.textContaining('2025'), findsWidgets);
    });

    testWidgets('renders with empty document fields', (tester) async {
      const emptyDocument = DocumentModel();

      await tester.pumpWidget(
        const MaterialApp(
          home: DetailTodoScreen(document: emptyDocument),
        ),
      );

      // Should display '-' for empty fields
      expect(find.text('-'), findsWidgets);
    });

    testWidgets('renders AppBar with title "Detail"', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DetailTodoScreen(document: testDocument),
        ),
      );

      expect(find.text('Detail'), findsOneWidget);
    });

    testWidgets('renders TextApp widgets for all fields', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DetailTodoScreen(document: testDocument),
        ),
      );

      // Check that all fields are displayed
      expect(find.text('Test Todo'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('false'), findsOneWidget);
    });
  });
}
