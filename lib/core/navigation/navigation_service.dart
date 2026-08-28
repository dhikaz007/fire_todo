import 'package:flutter/material.dart';

/// Global navigation key for non-widget contexts (Dio interceptors, etc.)
class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState? get navigator => navigatorKey.currentState;

  /// Navigate to a route (replaces the whole stack)
  static void navigateTo(String route) {
    navigator?.pushNamedAndRemoveUntil(route, (route) => false);
  }

  /// Pop the current route
  static void pop() {
    navigator?.pop();
  }

  /// Check if we can pop
  static bool canPop() {
    return navigator?.canPop() ?? false;
  }
}
