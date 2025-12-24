import 'package:flutter_test/flutter_test.dart';

import 'package:fire_todo/feature/auth/domain/models/models.dart';

void main() {
  group('LoginModel', () {
    test('should create a LoginModel object from a complete JSON map', () {
      // 1. Siapkan data JSON yang lengkap
      final Map<String, dynamic> json = {
        'kind': 'identitytoolkit#GetAccountInfoResponse',
        'localId': '12345',
        'email': 'test@example.com',
        'displayName': 'John Doe',
        'idToken': 'mock_id_token',
        'registered': true,
        'refreshToken': 'mock_refresh_token',
        'expiresIn': '3600',
      };

      // 2. Buat instance dari JSON menggunakan fromJson
      final loginModel = LoginModel.fromJson(json);

      // 3. Bandingkan dengan instance yang diharapkan
      expect(loginModel.kind, 'identitytoolkit#GetAccountInfoResponse');
      expect(loginModel.localId, '12345');
      expect(loginModel.email, 'test@example.com');
      expect(loginModel.displayName, 'John Doe');
      expect(loginModel.idToken, 'mock_id_token');
      expect(loginModel.registered, true);
      expect(loginModel.refreshToken, 'mock_refresh_token');
      expect(loginModel.expiresIn, '3600');
    });

    test(
      'should create a LoginModel object with null values for missing keys',
      () {
        // 1. Siapkan data JSON yang tidak lengkap
        final Map<String, dynamic> json = {
          'kind': 'identitytoolkit#GetAccountInfoResponse',
          'localId': '12345',
          'email': 'test@example.com',
        };

        // 2. Buat instance dari JSON menggunakan fromJson
        final loginModel = LoginModel.fromJson(json);

        // 3. Bandingkan properti yang ada dan yang seharusnya null
        expect(loginModel.kind, 'identitytoolkit#GetAccountInfoResponse');
        expect(loginModel.localId, '12345');
        expect(loginModel.email, 'test@example.com');
        expect(loginModel.displayName, isNull);
        expect(loginModel.idToken, isNull);
        expect(loginModel.registered, isNull);
        expect(loginModel.refreshToken, isNull);
        expect(loginModel.expiresIn, isNull);
      },
    );
  });

  group('signUpModel', () {
    test('should create a signUpModel object from a complete JSON map', () {
      final Map<String, dynamic> json = {
        'kind': 'identitytoolkit#GetAccountInfoResponse',
        'idToken': 'idToken',
        'email': 'test@gmail.com',
        'refreshToken': 'refreshToken',
        'expiresIn': '3600',
        'localId': '12345',
      };

      final signUpModel = SignUpModel.fromJson(json);

      expect(signUpModel.kind, 'identitytoolkit#GetAccountInfoResponse');
      expect(signUpModel.idToken, 'idToken');
      expect(signUpModel.email, 'test@gmail.com');
      expect(signUpModel.refreshToken, 'refreshToken');
      expect(signUpModel.expiresIn, '3600');
      expect(signUpModel.localId, '12345');
    });

    test('should create a signUpModel with null values for missing keys', () {
      final Map<String, dynamic> json = {
        'kind': 'identitytoolkit#GetAccountInfoResponse',
        'idToken': 'idToken',
        'email': 'test@gmail.com',
      };

      final signUpModel = SignUpModel.fromJson(json);

      expect(signUpModel.kind, 'identitytoolkit#GetAccountInfoResponse');
      expect(signUpModel.idToken, 'idToken');
      expect(signUpModel.email, 'test@gmail.com');
      expect(signUpModel.refreshToken, isNull);
      expect(signUpModel.expiresIn, isNull);
      expect(signUpModel.localId, isNull);
    });
  });
  group('requestEmailModel', () {
    test(
      'should create a requestEmailModel object from a complete JSON map',
      () {
        final Map<String, dynamic> json = {
          'kind': 'identitytoolkit#GetAccountInfoResponse',
          'email': 'test@gmail.com',
        };

        final signUpModel = SignUpModel.fromJson(json);

        expect(signUpModel.kind, 'identitytoolkit#GetAccountInfoResponse');
        expect(signUpModel.email, 'test@gmail.com');
      },
    );

    test(
      'should create a requestEmailModel with null values for missing keys',
      () {
        final Map<String, dynamic> json = {
          'kind': 'identitytoolkit#GetAccountInfoResponse',
        };

        final signUpModel = SignUpModel.fromJson(json);

        expect(signUpModel.kind, 'identitytoolkit#GetAccountInfoResponse');
        expect(signUpModel.idToken, isNull);
        expect(signUpModel.email, isNull);
      },
    );
  });
}
