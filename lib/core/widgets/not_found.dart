import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../constant/color.dart';
import '../constant/icons.dart';
import 'button_primary.dart';
import 'svg.dart';
import 'text.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextApp(
                    text: 'Sorry',
                    color: ColorApp.primary(50),
                    size: FontAppSize.font_36,
                    weight: FontAppWeight.bold,
                  ),
                  const Gap(12),
                  SvgApp(
                    assetName: IconsApp.icFaceSad,
                    height: 44,
                    width: 44,
                    color: ColorApp.primary(50),
                  ),
                ],
              ),
              const Gap(12),
              TextApp(
                text: "The page doesn't exists yet !",
                color: ColorApp.upcoming(50),
                size: FontAppSize.font_24,
                weight: FontAppWeight.bold,
                align: TextAlign.center,
              ),
              const Spacer(flex: 4),
              ButtonPrimary(
                label: 'Go Back',
                onPressed: () => context.pop(),
              ),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}
