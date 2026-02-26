import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'snackbar.dart';

class ButtonDoubleBack extends StatefulWidget {
  final Widget child;
  const ButtonDoubleBack({super.key, required this.child});

  @override
  State<ButtonDoubleBack> createState() => _ButtonDoubleBackState();
}

class _ButtonDoubleBackState extends State<ButtonDoubleBack> {
  DateTime? _lastTimePressed;

  void _handleBackPress(BuildContext context) {
    final now = DateTime.now();

    if (_lastTimePressed != null &&
        now.difference(_lastTimePressed!) < const Duration(seconds: 2)) {
      FlutterExitApp.exitApp(iosForceExit: true);
    } else {
      _lastTimePressed = now;
      SnackbarApp.showSnackbar(context,
          msg: "Press back again to Exit", type: SnackbarType.info);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope<bool>(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (Modular.to.canPop()) {
          Modular.to.pop();
        } else {
          _handleBackPress(context);
        }
      },
      child: widget.child,
    );
  }
}
