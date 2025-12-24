part of 'routes.dart';

class NotificationsModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (_) => const NotificationsScreen());
  }
}
