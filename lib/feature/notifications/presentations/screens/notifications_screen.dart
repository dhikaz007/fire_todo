import 'package:flutter/material.dart';

import '../../../../constant/constant.dart';
import '../../../../shared/widgets/widgets.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorApp.backgroundLight,
      appBar: AppbarApp(
        title: 'Notifications',
        canPop: true,
      ),
    );
  }
}
