part of 'shared.dart';

class SvgApp extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final String? semanticsLabel;
  final Widget Function(BuildContext)? placeholderBuilder;
  final String? package;
  const SvgApp({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.semanticsLabel,
    this.placeholderBuilder,
    this.package,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      semanticsLabel: semanticsLabel,
      placeholderBuilder: placeholderBuilder,
      errorBuilder: (context, error, stackTrace) => Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.close, color: ColorApp.primary2(50)),
            const Gap(8),
            TextApp(
              text: 'Error',
              size: FontAppSize.font_14,
              color: ColorApp.primary2(50),
            ),
          ],
        ),
      ),
      colorFilter:
          color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
