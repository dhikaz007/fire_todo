part of 'routes.dart';

class AuthModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (_) => const LoginScreen());
    r.child('/sign-up', child: (_) => const SignUpScreen());
    r.child('/verify', child: (_) => const VerifyEmailScreen());
  }
}
