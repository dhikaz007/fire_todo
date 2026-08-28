import 'package:flutter/material.dart';

import '../logging/app_logger.dart';

/// Global navigator observer that logs navigation events with route paths.
/// Works with Modular v7 by reading the actual path from Router's
/// RouteInformationProvider instead of route.settings.name.
class AppNavigatorObserver extends NavigatorObserver {
  final AppLogger _log = AppLogger();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    final path = _currentPath;
    if (path != null) {
      _log.i('🧭 PUSH → $path');
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    final path = _currentPath;
    if (path != null) {
      _log.i('🧭 POP → $path');
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _log.i('🧭 REMOVE');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    final path = _currentPath;
    if (path != null) {
      _log.i('🧭 REPLACE → $path');
    }
  }

  /// Get the current route path from Router's RouteInformationProvider.
  String? get _currentPath {
    try {
      final nav = navigator;
      if (nav == null) return null;
      final router = Router.of(nav.context);
      return router.routeInformationProvider?.value.uri.path;
    } catch (_) {
      return null;
    }
  }
}
