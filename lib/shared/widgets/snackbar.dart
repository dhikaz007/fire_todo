import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import 'text.dart';

enum SnackbarType { success, failed, info }

class SnackbarApp {
  static Future<dynamic> showSnackbar(
    BuildContext context, {
    required String msg,
    required SnackbarType type,
    Duration? duration,
  }) async {
    Color backgroundColor;
    Color textColor;
    IconData iconData;

    switch (type) {
      case SnackbarType.success:
        backgroundColor = ColorApp.success(50);
        textColor = ColorApp.white;
        iconData = Icons.check_circle;
        break;
      case SnackbarType.failed:
        backgroundColor = ColorApp.primary2(50);
        textColor = ColorApp.white;
        iconData = Icons.cancel;
        break;
      case SnackbarType.info: // Contoh penambahan tipe baru
        backgroundColor = ColorApp.upcoming(50);
        textColor = ColorApp.white;
        iconData = Icons.info;
        break;
    }

    return Flushbar(
      key: const ValueKey('snackbarWidget'),
      icon: Icon(iconData, color: textColor, size: 20),
      messageText: TextApp(
        key: const ValueKey('snackbarWidgetText'),
        text: msg,
        size: FontAppSize.font_14,
        weight: FontAppWeight.medium,
        color: textColor,
      ),
      borderRadius: BorderRadius.circular(12),
      backgroundColor: backgroundColor,
      forwardAnimationCurve: Curves.easeInOut,
      reverseAnimationCurve: Curves.easeInOut,
      flushbarStyle: FlushbarStyle.GROUNDED,
      duration: duration ?? const Duration(milliseconds: 1800),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      isDismissible: true,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    ).show(context);
  }
}
