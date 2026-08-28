import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../../app/app_paths.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/widgets/text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> _progress = ValueNotifier(0.0);
  late final AnimationController _anim;

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        _progress.value = _anim.value;
      });

    _initialize();
  }

  Future<void> _initialize() async {
    _animateTo(0.2);

    await Future.delayed(const Duration(milliseconds: 300));

    _animateTo(0.5);

    _animateTo(1.0);
    await Future.delayed(const Duration(milliseconds: 300));

    if (!mounted) return;

    context.replace(AppPaths.main);
  }

  void _animateTo(double target) {
    _anim.animateTo(target, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _progress.dispose();
    _anim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(flex: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextApp(
                  key: const Key('fireText'),
                  text: 'Fire',
                  size: FontAppSize.font_28,
                  weight: FontAppWeight.bold,
                  color: ColorApp.primary(50),
                ),
                const Gap(4),
                TextApp(
                  key: const Key('todoText'),
                  text: 'Todo',
                  size: FontAppSize.font_28,
                  weight: FontAppWeight.bold,
                  color: ColorApp.upcoming(50),
                ),
              ],
            ),
            const Spacer(flex: 4),
            ValueListenableBuilder(
              valueListenable: _progress,
              builder: (context, value, _) => Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: ColorApp.grey.withValues(alpha: .5),
                    borderRadius: BorderRadius.circular(8)),
                child: LinearProgressIndicator(
                  minHeight: 12,
                  borderRadius: BorderRadius.circular(4),
                  value: value,
                  backgroundColor: Colors.transparent,
                  color: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation(ColorApp.primary(50)),
                ),
              ),
            ),
            const Gap(8),
            ValueListenableBuilder(
              valueListenable: _progress,
              builder: (_, value, __) => TextApp(
                text: '${(value * 100).toStringAsFixed(0)} %',
                size: FontAppSize.font_14,
                weight: FontAppWeight.medium,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
