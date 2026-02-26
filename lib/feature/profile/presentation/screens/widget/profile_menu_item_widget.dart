import 'package:flutter/material.dart';

import '../../../../../constant/constant.dart';
import '../../../../../shared/widgets/widgets.dart';

class ProfileMenuItemWidget extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const ProfileMenuItemWidget({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextApp(
                text: label,
                size: FontAppSize.font_16,
                weight: FontAppWeight.medium,
              ),
            ),
            Container(
              color: ColorApp.primary(30),
              constraints: const BoxConstraints(minHeight: 50),
              padding: const EdgeInsets.all(16),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
