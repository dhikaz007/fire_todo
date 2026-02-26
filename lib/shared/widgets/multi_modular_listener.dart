import 'package:flutter/material.dart';

typedef ListenerBuilder = Widget Function(Widget child);

class MultiModularListener extends StatelessWidget {
  final List<ListenerBuilder> listeners;
  final Widget child;
  const MultiModularListener({
    super.key,
    required this.listeners,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Widget currentChild = child;
    for (var listenerBuilder in listeners.reversed) {
      currentChild = listenerBuilder(currentChild);
    }
    return currentChild;
  }
}
