import 'package:fire_todo/feature/todo/presentation/cubit/todo_cubit.dart';
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
      var state = const TodoState.loaded();
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
    test('TodoAddSuccess is an instance of TodoState', () {
      var state = const TodoState.add();
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
    test('TodoDeleteSuccess is an instance of TodoState', () {
      var state = const TodoState.delete();
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
    test('TodoDeleteAllSuccess is an instance of TodoState', () {
      var state = const TodoState.deleteAll();
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
    test('TodoEditSuccess is an instance of TodoState', () {
      var state = const TodoState.edit();
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
    test('TodoLoadDetail is an instance of TodoState', () {
      var state = const TodoState.detail();
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
    test('TodoFailed is an instance of TodoState', () {
      var state = const TodoState.failed();
      expect(state, isA<TodoState>());
      debugPrint(passTest);
    });
  });
}
