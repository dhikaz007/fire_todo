import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/models/models.dart';

class DetailTodoScreen extends StatelessWidget {
  final DocumentModel document;
  const DetailTodoScreen({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundLight,
      appBar: const AppbarApp(
        title: 'Detail',
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        constraints: const BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextApp(text: document.name ?? '-'),
            const Gap(12),
            TextApp(text: document.fields?.title?.stringValue ?? '-'),
            const Gap(12),
            TextApp(text: document.fields?.description?.stringValue ?? '-'),
            const Gap(12),
            TextApp(
                text: document.fields?.dueDate?.timestampValue
                        ?.toIso8601String() ??
                    '-'),
            const Gap(12),
            TextApp(
                text: document.fields?.isDone?.booleanValue.toString() ?? '-'),
            const Gap(12),
          ],
        ),
      ),
    );
  }
}
