import 'package:flutter_modular/flutter_modular.dart';

import '../domain/models/models.dart';
import '../presentation/screens/screens.dart';

/// Notifications feature module.
final notificationsModule = createModule(
  path: '/notifications',
  register: (c) {
    c
      ..route('/', child: (ctx, state) => const NotificationsScreen())
      ..route('/detail', child: (ctx, state) {
        final args = state.arguments;
        return NotificationDetailScreen(
          notification: args is NotificationModel ? args : null,
        );
      });
  },
);
