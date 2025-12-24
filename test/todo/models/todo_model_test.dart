import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fire_todo/feature/todo/domain/models/models.dart';

void main() {
  const passTest = 'Test Complete JSON ✅';
  const passMissingTest = 'Test Missing Keys JSON ✅';

  group('Todo Model Test =>', () {
    setUp(() {
      debugPrint('Start Debug Test');
    });
    tearDown(() {
      debugPrint('End Debug Test');
    });
    test('should create a IsDoneValueModel object', () {
      final Map<String, dynamic> json = {'booleanValue': true};

      final model = IsDoneValueModel.fromJson(json);
      expect(model.booleanValue, true);
      debugPrint(passTest);
      final Map<String, dynamic> json2 = {'booleanValue': null};

      final model2 = IsDoneValueModel.fromJson(json2);
      expect(model2.booleanValue, isNull);
      debugPrint(passMissingTest);
    });
    test('should create a DescriptionValueModel object', () async {
      const mock = 'mock_description';
      final Map<String, dynamic> json = {'stringValue': mock};

      final model = DescriptionValueModel.fromJson(json);
      expect(model.stringValue, mock);
      debugPrint(passTest);

      final Map<String, dynamic> json2 = {'stringValue': null};

      final model2 = DescriptionValueModel.fromJson(json2);
      expect(model2.stringValue, isNull);
      debugPrint(passMissingTest);
    });
    test('should create a DueDateValueModel object', () async {
      final mock = DateTime.now().toString();
      final Map<String, dynamic> json = {'timestampValue': mock};

      final model = DueDateValueModel.fromJson(json);
      expect(model.timestampValue, DateTime.parse(mock));
      debugPrint(passTest);
      final Map<String, dynamic> json2 = {'timestampValue': null};

      final model2 = DueDateValueModel.fromJson(json2);
      expect(model2.timestampValue, isNull);
      debugPrint(passMissingTest);
    });
    test('should create a FieldsModel object', () async {
      final mockTime = DateTime.parse('2024-05-21T10:00:00.000Z');
      final Map<String, dynamic> json = {
        'title': {'stringValue': 'mock_title'},
        'description': {'stringValue': 'mock_description'},
        'isDone': {'booleanValue': false},
        'dueDate': {
          'timestampValue': mockTime.toIso8601String(),
        },
      };

      final model = FieldsModel.fromJson(json);
      expect(model.title?.stringValue, 'mock_title');
      expect(model.description?.stringValue, 'mock_description');
      expect(model.isDone?.booleanValue, false);
      expect(model.dueDate?.timestampValue, mockTime);
      debugPrint(passTest);
      final Map<String, dynamic> json2 = {
        'title': {'stringValue': 'mock_title'},
        'description': {'stringValue': 'mock_description'},
        'isDone': {'booleanValue': null},
        'dueDate': {
          'timestampValue': null,
        },
      };

      final model2 = FieldsModel.fromJson(json2);
      expect(model2.title?.stringValue, 'mock_title');
      expect(model2.description?.stringValue, 'mock_description');
      expect(model2.isDone?.booleanValue, isNull);
      expect(model2.dueDate?.timestampValue, isNull);
      debugPrint(passMissingTest);
    });
    test('should create a DocumentModel object', () async {
      final mockTime = DateTime.parse('2024-05-21T10:00:00.000Z');

      final Map<String, dynamic> json = {
        'name': 'mock_name',
        'fields': {
          'title': {'stringValue': 'mock_title'},
          'description': {'stringValue': 'mock_description'},
          'isDone': {'booleanValue': false},
          'dueDate': {'timestampValue': mockTime.toIso8601String()},
        },
        'createTime': mockTime.toIso8601String(),
        'updateTime': mockTime.toIso8601String(),
      };

      final model = DocumentModel.fromJson(json);
      expect(model.name, 'mock_name');
      expect(model.fields?.title?.stringValue, 'mock_title');
      expect(model.fields?.description?.stringValue, 'mock_description');
      expect(model.fields?.isDone?.booleanValue, false);
      expect(model.fields?.dueDate?.timestampValue, mockTime);
      expect(model.createTime, mockTime);
      expect(model.updateTime, mockTime);
      debugPrint(passTest);
      final Map<String, dynamic> json2 = {
        'name': 'mock_name',
        'fields': {
          'title': {'stringValue': 'mock_title'},
          'description': {'stringValue': 'mock_description'},
          'isDone': {'booleanValue': false},
          'dueDate': {'timestampValue': mockTime.toIso8601String()},
        },
        'createTime': null,
        'updateTime': null,
      };

      final model2 = DocumentModel.fromJson(json2);
      expect(model2.name, 'mock_name');
      expect(model2.fields?.title?.stringValue, 'mock_title');
      expect(model2.fields?.description?.stringValue, 'mock_description');
      expect(model2.fields?.isDone?.booleanValue, false);
      expect(model2.fields?.dueDate?.timestampValue, mockTime);
      expect(model2.createTime, null);
      expect(model2.updateTime, null);
      debugPrint(passMissingTest);
    });

    test('should create a ListTodoModel object', () {
      final mockTime = DateTime.parse('2024-05-21T10:00:00.000Z');

      final Map<String, dynamic> json = {
        'documents': [
          {
            'name': 'mock_name',
            'fields': {
              'title': {'stringValue': 'mock_title'},
              'description': {'stringValue': 'mock_description'},
              'isDone': {'booleanValue': false},
              'dueDate': {'timestampValue': mockTime.toIso8601String()},
            },
            'createTime': mockTime.toIso8601String(),
            'updateTime': mockTime.toIso8601String(),
          },
        ],
      };

      final model = ListTodoModel.fromJson(json);
      expect(model.documents, isList);
      expect(model.documents?.length, 1);
      expect(model.documents?[0].name, 'mock_name');
      debugPrint(passTest);

      final Map<String, dynamic> json2 = {
        'documents': [],
      };

      final model2 = ListTodoModel.fromJson(json2);
      expect(model2.documents, isList);
      expect(model2.documents?.length, 0);
      debugPrint(passMissingTest);
    });
  });
}
