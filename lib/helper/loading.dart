import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoadingHelper {
  static void showLoad(BuildContext context) {
    if (!context.loaderOverlay.visible) context.loaderOverlay.show();
  }

  static void hideLoad(BuildContext context) {
    if (context.loaderOverlay.visible) context.loaderOverlay.hide();
  }
}
