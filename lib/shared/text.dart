part of 'shared.dart';

enum FontAppSize {
  font_10(10),
  font_12(12),
  font_14(14),
  font_16(16),
  font_18(18),
  font_20(20),
  font_24(24),
  font_28(28),
  font_36(36),
  font_40(40);

  final double value;
  const FontAppSize(this.value);
}

enum FontAppWeight { light, normal, medium, semiBold, bold }

extension FontWeightExtension on FontAppWeight {
  FontWeight get value => switch (this) {
        FontAppWeight.light => FontWeight.w300,
        FontAppWeight.normal => FontWeight.w400,
        FontAppWeight.medium => FontWeight.w500,
        FontAppWeight.semiBold => FontWeight.w600,
        FontAppWeight.bold => FontWeight.w700,
      };
}

class TextApp extends StatelessWidget {
  final String text;
  final FontAppSize size;
  final FontAppWeight weight;
  final Color? color;
  final int? maxLines;
  final TextAlign? align;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  const TextApp({
    super.key,
    required this.text,
    this.size = FontAppSize.font_12,
    this.weight = FontAppWeight.normal,
    this.color,
    this.maxLines,
    this.align,
    this.overflow,
    this.decoration,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textScaler = MediaQuery.textScalerOf(context);
    return Text(
      text,
      style: TextStyle(
        fontSize: textScaler.scale(size.value),
        fontWeight: weight.value,
        color: color ?? ColorApp.textPrimary,
        decoration: decoration,
        fontStyle: fontStyle,
      ),
      maxLines: maxLines,
      textAlign: align,
      overflow: overflow,
    );
  }
}
