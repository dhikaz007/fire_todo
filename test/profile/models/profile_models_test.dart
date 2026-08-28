import 'package:fire_todo/feature/profile/domain/models/user_model.dart';
import 'package:fire_todo/feature/profile/domain/models/delete_account_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserModel', () {
    test('should create UserModel from JSON', () {
      final json = {
        'kind': 'identitytoolkit#GetAccountInfoResponse',
        'users': [
          {
            'localId': 'uid123',
            'email': 'test@example.com',
            'displayName': 'Test User',
            'passwordHash': 'hash123',
            'emailVerified': true,
            'passwordUpdatedAt': 1234567890,
            'validSince': '1234567890',
            'disabled': false,
            'lastLoginAt': '1234567890',
            'createdAt': '1234567890',
          }
        ],
      };

      final model = UserModel.fromJson(json);

      expect(model.kind, 'identitytoolkit#GetAccountInfoResponse');
      expect(model.users, isNotNull);
      expect(model.users!.length, 1);
      expect(model.users!.first.localId, 'uid123');
      expect(model.users!.first.email, 'test@example.com');
      expect(model.users!.first.displayName, 'Test User');
      expect(model.users!.first.emailVerified, true);
    });

    test('should create UserModel with null values', () {
      final json = <String, dynamic>{};

      final model = UserModel.fromJson(json);

      expect(model.kind, isNull);
      expect(model.users, isNull);
    });

    test('should serialize UserModel to JSON', () {
      const model = UserModel(
        kind: 'test',
        users: [
          UserElementData(
            localId: 'uid123',
            email: 'test@example.com',
          ),
        ],
      );

      final json = model.toJson();

      expect(json['kind'], 'test');
      expect(json['users'], isA<List>());
      expect(json['users'], isNotEmpty);
    });

    test('should create empty UserModel with const constructor', () {
      const model = UserModel();

      expect(model.kind, isNull);
      expect(model.users, isNull);
    });
  });

  group('UserElementData', () {
    test('should create UserElementData from JSON', () {
      final json = {
        'localId': 'uid456',
        'email': 'user@example.com',
        'displayName': 'User Name',
        'passwordHash': 'hash456',
        'emailVerified': false,
        'passwordUpdatedAt': 9876543210,
        'providerUserInfo': [
          {
            'providerId': 'password',
            'displayName': 'User Name',
            'email': 'user@example.com',
          }
        ],
        'validSince': '9876543210',
        'disabled': false,
        'lastLoginAt': '9876543210',
        'createdAt': '9876543210',
      };

      final model = UserElementData.fromJson(json);

      expect(model.localId, 'uid456');
      expect(model.email, 'user@example.com');
      expect(model.displayName, 'User Name');
      expect(model.emailVerified, false);
      expect(model.providerUserInfo, isNotNull);
      expect(model.providerUserInfo!.length, 1);
      expect(model.providerUserInfo!.first.providerId, 'password');
    });

    test('should serialize UserElementData to JSON', () {
      const model = UserElementData(
        localId: 'uid789',
        email: 'test@test.com',
        displayName: 'Test',
      );

      final json = model.toJson();

      expect(json['localId'], 'uid789');
      expect(json['email'], 'test@test.com');
      expect(json['displayName'], 'Test');
    });
  });

  group('DeleteAccountModel', () {
    test('should create DeleteAccountModel from JSON', () {
      final json = {'kind': 'identitytoolkit#DeleteAccountResponse'};

      final model = DeleteAccountModel.fromJson(json);

      expect(model.kind, 'identitytoolkit#DeleteAccountResponse');
    });

    test('should create empty DeleteAccountModel', () {
      final json = <String, dynamic>{};

      final model = DeleteAccountModel.fromJson(json);

      expect(model.kind, isNull);
    });

    test('should serialize DeleteAccountModel to JSON', () {
      const model = DeleteAccountModel(kind: 'test');

      final json = model.toJson();

      expect(json['kind'], 'test');
    });

    test('should create empty DeleteAccountModel with const constructor', () {
      const model = DeleteAccountModel();

      expect(model.kind, isNull);
    });
  });
}
