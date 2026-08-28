import 'package:flutter/material.dart';

import '../constant/color.dart';
import 'text.dart';

class ButtonPrimary extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Widget? icon;
  final IconAlignment alignment;
  final double radius;
  final FontAppSize size;
  const ButtonPrimary({
    super.key,
    required this.label,
    this.onPressed,
    this.width,
    this.height,
    this.icon,
    this.alignment = IconAlignment.start,
    this.radius = 8,
    this.size = FontAppSize.font_14,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorApp.primary(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: onPressed,
      iconAlignment: alignment,
      icon: icon,
      label: TextApp(
        size: size,
        text: label,
        color: ColorApp.white,
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
