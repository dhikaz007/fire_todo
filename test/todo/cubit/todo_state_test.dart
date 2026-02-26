import 'package:fire_todo/feature/todo/presentation/cubit/todo_cubit.dart';
import 'package:fire_todo/feature/todo/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const passTest = 'Test Complete ✅';
  group('Todo Cubit State Test =>', () {
    setUp(() {
      debugPrint('Start Debug Test');
    });
    tearDown(() {
      debugPrint('End Debug Test');
    });

    test('TodoInitial is an instance of TodoState', () {
      var state = const TodoState.initial();
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
    test('TodoLoading is an instance of TodoState', () {
      var state = const TodoState.loading();
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
    test('TodoLoaded is an instance of TodoState', () {
      var state = const TodoState.loaded(response: ListTodoModel());
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
    test('TodoAddSuccess is an instance of TodoState', () {
      var state = const TodoState.add(response: DocumentModel());
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
    test('TodoDeleteSuccess is an instance of TodoState', () {
      var state = const TodoState.delete(response: '');
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
    test('TodoDeleteAllSuccess is an instance of TodoState', () {
      var state = const TodoState.deleteAll(response: '');
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
    test('TodoEditSuccess is an instance of TodoState', () {
      var state = const TodoState.edit(response: DocumentModel());
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
    test('TodoLoadDetail is an instance of TodoState', () {
      var state = const TodoState.detail(response: DocumentModel());
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
    test('TodoFailed is an instance of TodoState', () {
      var state = const TodoState.failed(errorMessage: '');
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
  });
}
