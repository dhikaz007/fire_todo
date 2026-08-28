import 'package:flutter/material.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/widgets/widgets.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorApp.backgroundLight,
      appBar: AppbarApp(
        title: 'Notifications',
      ),
    );
  }
}
