import 'package:flutter/material.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/widgets/widgets.dart';

class NotificationSearchField extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const NotificationSearchField({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormFieldApp(
      hintText: 'Search notifications',
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      borderRadius: 8,
      filled: true,
      filledColor: ColorApp.backgroundGrey,
      enabledBorderColor: ColorApp.border,
      focusedBorderColor: ColorApp.primary(50),
      prefixIcon: const Icon(
        Icons.search,
        color: ColorApp.textSecondary,
        size: 20,
      ),
    );
  }
}
