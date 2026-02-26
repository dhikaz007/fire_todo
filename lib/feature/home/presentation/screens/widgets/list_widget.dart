import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';
import '../../../../../extensions/extensions.dart';
import '../../../../../shared/widgets/widgets.dart';
import '../../../../todo/domain/models/models.dart';

class ListWidget extends StatelessWidget {
  final DocumentModel document;
  final VoidCallback? onTap;
  final Function(BuildContext)? onEdit;
  final Function(BuildContext)? onDelete;
  final Function(bool?)? onComplete;
  final String valKey;
  final bool enableSlide;
  const ListWidget({
    super.key,
    required this.document,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.valKey = '',
    this.onComplete,
    this.enableSlide = true,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: enableSlide,
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            backgroundColor: ColorApp.secondary(50),
            onPressed: onEdit,
            icon: Icons.edit,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            backgroundColor: ColorApp.primary2(50),
            onPressed: onDelete,
            icon: Icons.delete,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: ColorApp.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: ColorApp.grey,
                offset: Offset(0, 1),
                blurRadius: 2,
              ),
            ],
            border: Border(
              left: BorderSide(color: ColorApp.success(50), width: 8),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextApp(
                        text: document.fields?.title?.stringValue ?? '-',
                        size: FontAppSize.font_14,
                        weight: FontAppWeight.bold,
                      ),
                      const Gap(8),
                      TextApp(
                        text: document.fields?.description?.stringValue ?? '-',
                        color: ColorApp.textSecondary,
                        weight: FontAppWeight.medium,
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextApp(
                    text:
                        "${document.fields?.dueDate?.timestampValue?.getFullDate()}",
                    weight: FontAppWeight.medium,
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextApp(
                          text: 'Completed',
                          weight: FontAppWeight.semiBold,
                          color: document.fields?.isDone?.booleanValue == true
                              ? ColorApp.success(50)
                              : ColorApp.textPrimary,
                        ),
                        Checkbox.adaptive(
                          activeColor: ColorApp.primary(50),
                          visualDensity: VisualDensity.compact,
                          value: document.fields?.isDone?.booleanValue,
                          onChanged: onComplete,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
