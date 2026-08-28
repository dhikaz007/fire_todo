import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/widgets/widgets.dart';

class EditTodoScreen extends StatefulWidget {
  const EditTodoScreen({super.key});

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundLight,
      appBar: AppBar(backgroundColor: ColorApp.primary(50)),
      body: Column(
        children: [
          const Gap(16),
          SwitchListTile.adaptive(
            title: const TextApp(
              text: 'Already Done',
              size: FontAppSize.font_14,
              weight: FontAppWeight.bold,
            ),
            contentPadding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            activeThumbColor: ColorApp.primary(50),
            value: _isDone,
            onChanged: (value) {
              setState(() {
                _isDone = value;
                // debugPrint(_isDone.toString());
              });
            },
          ),
        ],
      ),
    );
  }
}
