import 'package:flutter/material.dart';

class ColorApp {
  const ColorApp._();

  static Color primary(int shade) {
    switch (shade) {
      case 10:
        return const Color(0xFFFFF0EB);
      case 30:
        return const Color(0xFFFFD3C2);
      case 50:
        return const Color(0xFFFF6B35);
      case 70:
        return const Color(0xFFB34B25);
      case 90:
        return const Color(0xFF33150B);
      default:
        return const Color(0xFFFF6B35);
    }
  }

  static Color primary2(int shade) {
    switch (shade) {
      case 10:
        return const Color(0xFFFFEBEA);
      case 30:
        return const Color(0xFFFFC5C1);
      case 50:
        return const Color(0xFFFF3B30);
      case 70:
        return const Color(0xFFB32921);
      case 90:
        return const Color(0xFF330C0A);
      default:
        return const Color(0xFFFF3B30);
    }
  }

  static Color secondary(int shade) {
    switch (shade) {
      case 10:
        return const Color(0xFFFFF9E6);
      case 30:
        return const Color(0xFFFFECB5);
      case 50:
        return const Color(0xFFFFC107);
      case 70:
        return const Color(0xFFB38705);
      case 90:
        return const Color(0xFF332701);
      default:
        return const Color(0xFFFFC107);
    }
  }

  static Color success(int shade) {
    switch (shade) {
      case 10:
        return const Color(0xFFEDF7ED);
      case 30:
        return const Color(0xFFC9E7CA);
      case 50:
        return const Color(0xFF4CAF50);
      case 70:
        return const Color(0xFF357A38);
      case 90:
        return const Color(0xFF0F2310);
      default:
        return const Color(0xFF4CAF50);
    }
  }

  static Color upcoming(int shade) {
    switch (shade) {
      case 10:
        return const Color(0xFFE9F4FE);
      case 30:
        return const Color(0xFFBCE0FD);
      case 50:
        return const Color(0xFF2196F3);
      case 70:
        return const Color(0xFF1769AA);
      case 90:
        return const Color(0xFF071E31);
      default:
        return const Color(0xFF2196F3);
    }
  }

  static const backgroundLight = Color(0xFFF9FAFB);
  static const border = Color(0xFFE8E8EE);
  static const backgroundDark = Color(0xFF1E1E1E);
  static const backgroundGrey = Color(0xFFF5F5F5);
  static const textPrimary = Color(0xFF212121);
  static const textSecondary = Color(0xFF757575);

  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFF757575);
}
