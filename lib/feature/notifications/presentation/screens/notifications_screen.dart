import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/models/models.dart';
import '../../module/notifications_paths.dart';
import 'widgets/widgets.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // ponytail: static demo data, replace with repository/cubit when API ready
  List<NotificationModel> _notifications = const [
    NotificationModel(
      id: '1',
      title: 'Task Due Soon',
      body: '"Buy groceries" is due in 2 hours',
      type: 'Task Due Soon',
      time: '5m ago',
    ),
    NotificationModel(
      id: '2',
      title: 'New Project Invite',
      body: 'Sarah invited you to "Q3 Marketing Launch"',
      type: 'New Project Invite',
      time: '1h ago',
    ),
    NotificationModel(
      id: '3',
      title: 'High Priority Task Added',
      body: '"Finalize Budget Report" was marked as High Priority',
      type: 'High Priority Task Added',
      time: '3h ago',
    ),
    NotificationModel(
      id: '4',
      title: 'Goal Achieved!',
      body: 'You completed 10 tasks this week. Keep the fire burning.',
      type: 'Goal Achieved!',
      time: 'Yesterday',
      isRead: true,
    ),
    NotificationModel(
      id: '5',
      title: 'System Update',
      body: 'Fire Todo v2.1 is now live with new dark mode enhancements.',
      type: 'System Update',
      time: '2 days ago',
      isRead: true,
    ),
  ];

  String _query = '';

  List<NotificationModel> get _filtered {
    if (_query.isEmpty) return _notifications;
    return _notifications
        .where(
          (e) =>
              (e.title ?? '').toLowerCase().contains(_query) ||
              (e.body ?? '').toLowerCase().contains(_query),
        )
        .toList();
  }

  int get _unreadCount =>
      _notifications.where((e) => !e.isRead).length;

  void _markAllAsRead() {
    setState(() {
      _notifications = _notifications
          .map((e) => e.copyWith(isRead: true))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifications = _filtered;

    return Scaffold(
      backgroundColor: ColorApp.backgroundLight,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: Row(
                children: [
                  const TextApp(
                    text: 'Notifications',
                    size: FontAppSize.font_24,
                    weight: FontAppWeight.bold,
                  ),
                  const Gap(8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: ColorApp.primary(50),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: TextApp(
                      text: '$_unreadCount',
                      weight: FontAppWeight.semiBold,
                      color: ColorApp.white,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: _markAllAsRead,
                    child: TextApp(
                      text: 'Mark all as read',
                      size: FontAppSize.font_16,
                      weight: FontAppWeight.semiBold,
                      color: ColorApp.primary(50),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: NotificationSearchField(
                onChanged: (value) =>
                    setState(() => _query = value.toLowerCase()),
              ),
            ),
            Expanded(
              child: notifications.isEmpty
                  ? const Center(
                      child: TextApp(
                        text: 'No notifications found',
                        size: FontAppSize.font_14,
                        color: ColorApp.textSecondary,
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                      itemCount: notifications.length,
                      separatorBuilder: (_, __) => const Gap(12),
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return NotificationItemWidget(
                          notification: notification,
                          onTap: () => context.pushNamed(
                            NotificationsPaths.detail,
                            arguments: notification,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
