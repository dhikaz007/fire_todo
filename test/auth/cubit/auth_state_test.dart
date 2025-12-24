import 'package:fire_todo/feature/auth/cubit/auth_cubit.dart';
import 'package:fire_todo/feature/auth/domain/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthState tests', () {
    test('AuthInitial is an instance of AuthState', () {
      var state = const AuthState.initial();
      expect(state, isA<AuthState>());
    });
    test('AuthLoading is an instance of AuthState', () {
      var state = const AuthState.loading();
      expect(state, isA<AuthState>());
    });

    test('AuthSuccess is an instance of AuthState', () {
      var state = const AuthState.authenticated(
          response: LoginModel(), token: 'test-token');
      expect(state, isA<AuthState>());
      state.maybeWhen(
        authenticated: (response, token) {
          expect(response, isA<LoginModel>());
          expect(token, 'test-token');
          expect(response, isNotNull);
        },
        orElse: () {
          fail('Expected AuthState.success but got another state.');
        },
      );
    });

    test('AuthFailed is an instance of AuthState', () {
      var state = const AuthState.failed(errorMessage: 'Error message');
      expect(state, isA<AuthState>());
      state.maybeWhen(
        failed: (errorMessage) => expect(errorMessage, equals('Error message')),
        orElse: () {},
      );
    });

    test('AuthLogout is an instance of AuthState', () {
      var state = const AuthState.logout();
      expect(state, isA<AuthState>());
    });

    test('AuthSignUp is an instance of AuthState', () {
      var state = const AuthState.signUp(response: SignUpModel());
      expect(state, isA<AuthState>());
      state.maybeWhen(
        signUp: (response) => expect(response, isA<SignUpModel>()),
        orElse: () {},
      );
    });

    test('AuthVerifyEmail is an instance of AuthState', () {
      var state = const AuthState.verifyEmail(response: RequestEmailModel());
      expect(state, isA<AuthState>());
      state.maybeWhen(
        signUp: (response) => expect(response, isA<RequestEmailModel>()),
        orElse: () {},
      );
    });
  });
}
