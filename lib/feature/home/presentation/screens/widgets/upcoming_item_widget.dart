import 'package:flutter/material.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/extensions/extensions.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../todo/domain/models/models.dart';

class UpcomingItemWidget extends StatelessWidget {
  final DocumentModel documentModel;
  const UpcomingItemWidget({super.key, required this.documentModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorApp.white,
        border: Border(
          left: BorderSide(
            width: 8,
            color: ColorApp.upcoming(50),
          ),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        visualDensity: VisualDensity.compact,
        contentPadding: EdgeInsets.zero,
        title: TextApp(
          text: documentModel.fields?.title?.stringValue ?? '-',
          size: FontAppSize.font_16,
          weight: FontAppWeight.semiBold,
        ),
        subtitle: TextApp(
          text: documentModel.fields?.dueDate?.timestampValue?.ddMMMy() ?? '-',
          size: FontAppSize.font_14,
        ),
      ),
    );
  }
}
