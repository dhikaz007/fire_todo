import 'package:flutter_modular/flutter_modular.dart';

import '../presentation/screens/screens.dart';

/// Notifications feature module.
final notificationsModule = createModule(
  path: '/notifications',
  register: (c) {
    c.route('/', child: (ctx, state) => const NotificationsScreen());
  },
);
