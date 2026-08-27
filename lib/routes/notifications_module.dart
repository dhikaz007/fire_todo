import 'package:flutter_modular/flutter_modular.dart';

import '../feature/notifications/presentation/screens/screens.dart';

class NotificationsModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (_) => const NotificationsScreen());
  }
}
