import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/models/models.dart';

class NotificationItemWidget extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback? onTap;

  const NotificationItemWidget({
    super.key,
    required this.notification,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isRead = notification.isRead;

    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: isRead ? 0 : 24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isRead
                  ? ColorApp.white.withValues(alpha: 0.6)
                  : ColorApp.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isRead
                    ? ColorApp.border.withValues(alpha: 0.5)
                    : ColorApp.border,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0A000000),
                  offset: Offset(0, 2),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextApp(
                        text: notification.title ?? '-',
                        size: FontAppSize.font_16,
                        weight: isRead
                            ? FontAppWeight.semiBold
                            : FontAppWeight.bold,
                        color: isRead
                            ? ColorApp.textSecondary
                            : ColorApp.textPrimary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Gap(8),
                    TextApp(
                      text: notification.time ?? '',
                      color: ColorApp.textSecondary,
                    ),
                  ],
                ),
                const Gap(4),
                TextApp(
                  text: notification.body ?? '',
                  size: FontAppSize.font_14,
                  color: ColorApp.textSecondary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        if (!isRead)
          Positioned(
            right: 8,
            top: 0,
            bottom: 0,
            child: Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: ColorApp.primary(50),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
