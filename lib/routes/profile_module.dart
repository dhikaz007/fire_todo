part of 'routes.dart';

class ProfileModule extends Module {
  @override
  void routes(r) {
    r.child('/settings', child: (_) => const SettingsScreen());
    r.child('/privacy', child: (_) => const PrivacyPolicyScreen());
  }
}
