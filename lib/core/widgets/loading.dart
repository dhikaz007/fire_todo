import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constant/color.dart';
import '../../gen/assets.gen.dart';
import 'svg.dart';
import 'text.dart';

class LoadingApp extends StatelessWidget {
  const LoadingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ColorApp.backgroundLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: .1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgApp(
                  assetName: Assets.icons.logo,
                  width: 40,
                  height: 40,
                ),
                const Gap(8),
                const TextApp(
                  text: 'Fire',
                  size: FontAppSize.font_14,
                  color: ColorApp.black,
                  weight: FontAppWeight.bold,
                ),
                const Gap(4),
                TextApp(
                  text: 'Todo',
                  size: FontAppSize.font_14,
                  color: ColorApp.primary(50),
                  weight: FontAppWeight.bold,
                ),
              ],
            ),
          ),
          const Gap(8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: ColorApp.primary(50),
                ),
              ),
              const Gap(12),
              TextApp(
                text: 'Loading...',
                size: FontAppSize.font_14,
                weight: FontAppWeight.semiBold,
                color: ColorApp.primary(50),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
