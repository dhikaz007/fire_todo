import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/models/models.dart';
import 'widgets/widgets.dart';

class NotificationDetailScreen extends StatelessWidget {
  final NotificationModel? notification;

  const NotificationDetailScreen({super.key, this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundLight,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).maybePop(),
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorApp.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorApp.border),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0A000000),
                            offset: Offset(0, 2),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: ColorApp.textPrimary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: ColorApp.primary(50),
                          size: 20,
                        ),
                        const Gap(8),
                        const TextApp(
                          text: 'NOTIFICATION',
                          weight: FontAppWeight.semiBold,
                          color: ColorApp.textSecondary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: ColorApp.primary(10),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: ColorApp.primary(50),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Gap(6),
                          TextApp(
                            text: (notification?.type ??
                                    'Task Due Soon')
                                .toUpperCase(),
                            weight: FontAppWeight.semiBold,
                            color: ColorApp.primary(50),
                          ),
                        ],
                      ),
                    ),
                    const Gap(8),
                    TextApp(
                      text: notification?.title ??
                          'Buy groceries before dinner',
                      size: FontAppSize.font_24,
                      weight: FontAppWeight.bold,
                    ),
                    const Gap(24),
                    Container(
                      width: double.maxFinite,
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
                      child: TextApp(
                        text: notification?.body ??
                            'This task is due soon. You added milk, eggs, bread, and fruits to the list. Make sure to stop by the store on your way home.',
                        size: FontAppSize.font_16,
                        color: ColorApp.textSecondary,
                      ),
                    ),
                    const Gap(24),
                    NotificationInfoRowWidget(
                      icon: Icons.calendar_today,
                      label: 'Due Date',
                      value: 'Today, 5:00 PM',
                      valueColor: ColorApp.primary(50),
                    ),
                    const Gap(8),
                    const NotificationInfoRowWidget(
                      icon: Icons.notifications,
                      label: 'Reminder',
                      value: '30 minutes before',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
