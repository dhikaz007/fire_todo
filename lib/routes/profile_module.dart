import 'package:flutter_modular/flutter_modular.dart';

import '../feature/profile/presentation/screens/screens.dart';

class ProfileModule extends Module {
  @override
  void routes(r) {
    r.child('/settings', child: (_) => const SettingsScreen());
    r.child('/privacy', child: (_) => const PrivacyPolicyScreen());
  }
}
