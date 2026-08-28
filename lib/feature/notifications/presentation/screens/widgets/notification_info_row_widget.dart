import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/widgets/widgets.dart';

class NotificationInfoRowWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const NotificationInfoRowWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorApp.border),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            offset: Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: ColorApp.backgroundLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 16, color: ColorApp.textSecondary),
          ),
          const Gap(8),
          Expanded(
            child: TextApp(
              text: label,
              size: FontAppSize.font_16,
              color: ColorApp.textSecondary,
            ),
          ),
          TextApp(
            text: value,
            size: FontAppSize.font_16,
            weight: FontAppWeight.semiBold,
            color: valueColor ?? ColorApp.textPrimary,
          ),
        ],
      ),
    );
  }
}
