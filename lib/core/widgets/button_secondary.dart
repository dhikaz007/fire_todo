import 'package:flutter/material.dart';

import '../constant/color.dart';
import 'text.dart';

class ButtonSecondary extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Widget? icon;
  final IconAlignment alignment;
  final double radius;
  const ButtonSecondary({
    super.key,
    required this.label,
    this.onPressed,
    this.width,
    this.height,
    this.icon,
    this.alignment = IconAlignment.start,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: ColorApp.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorApp.secondary(50)),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: onPressed,
      iconAlignment: alignment,
      icon: icon,
      label: TextApp(
        text: label,
        color: ColorApp.primary(50),
        weight: FontAppWeight.medium,
      ),
    );

    final accessibleButton = Semantics(
      label: label,
      button: true,
      child: button,
    );

    if (width != null || height != null) {
      return SizedBox(
        width: width,
        height: height,
        child: accessibleButton,
      );
    }

    return accessibleButton;
  }
}
