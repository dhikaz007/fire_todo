import 'package:fire_todo/feature/auth/domain/models/models.dart';
import 'package:fire_todo/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthState Unit Tests', () {
    test('initial state should be initialized correctly', () {
      const state = AuthState.initial();

      expect(state, const AuthState.initial());
    });

    test('authenticated state should hold correct data', () {
      const response = LoginModel();
      const token = 'test-token';
      const state = AuthState.authenticated(token: token);

      state.whenOrNull(
        authenticated: (resp, tok) {
          expect(resp, equals(response));
          expect(tok, equals(token));
        },
      );
    });

    test('failed state should hold correct error message', () {
      const errorMsg = 'Error message';
      const state = AuthState.failed(errorMessage: errorMsg);

      expect(
        state.maybeWhen(failed: (msg) => msg, orElse: () => null),
        equals(errorMsg),
      );
    });

    test('verifyEmail state should hold RequestEmailModel', () {
      const response = RequestEmailModel();
      const state = AuthState.verifyEmail();

      state.whenOrNull(
        verifyEmail: (resp) => expect(resp, equals(response)),
      );
    });

    test('simple states should return correct instance', () {
      expect(const AuthState.loading(), isA<AuthState>());
      expect(const AuthState.logout(), isA<AuthState>());
    });
  });
}

// void main() {
//   group('AuthState tests', () {
//     test('AuthInitial is an instance of AuthState', () {
//       var state = const AuthState.initial();
//       expect(state, isA<AuthState>());
//     });
//     test('AuthLoading is an instance of AuthState', () {
//       var state = const AuthState.loading();
//       expect(state, isA<AuthState>());
//     });

//     test('AuthSuccess is an instance of AuthState', () {
//       var state = const AuthState.authenticated(
//           response: LoginModel(), token: 'test-token');
//       expect(state, isA<AuthState>());
//       state.maybeWhen(
//         authenticated: (response, token) {
//           expect(response, isA<LoginModel>());
//           expect(token, 'test-token');
//           expect(response, isNotNull);
//         },
//         orElse: () {
//           fail('Expected AuthState.success but got another state.');
//         },
//       );
//     });

//     test('AuthFailed is an instance of AuthState', () {
//       var state = const AuthState.failed(errorMessage: 'Error message');
//       expect(state, isA<AuthState>());
//       state.maybeWhen(
//         failed: (errorMessage) => expect(errorMessage, equals('Error message')),
//         orElse: () {},
//       );
//     });

//     test('AuthLogout is an instance of AuthState', () {
//       var state = const AuthState.logout();
//       expect(state, isA<AuthState>());
//     });

//     test('AuthSignUp is an instance of AuthState', () {
//       var state = const AuthState.signUp(response: SignUpModel());
//       expect(state, isA<AuthState>());
//       state.maybeWhen(
//         signUp: (response) => expect(response, isA<SignUpModel>()),
//         orElse: () {},
//       );
//     });

//     test('AuthVerifyEmail is an instance of AuthState', () {
//       var state = const AuthState.verifyEmail(response: RequestEmailModel());
//       expect(state, isA<AuthState>());
//       state.maybeWhen(
//         signUp: (response) => expect(response, isA<RequestEmailModel>()),
//         orElse: () {},
//       );
//     });
//   });
// }
