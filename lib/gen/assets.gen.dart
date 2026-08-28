// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Montserrat-Black.ttf
  String get montserratBlack => 'assets/fonts/Montserrat-Black.ttf';

  /// File path: assets/fonts/Montserrat-Bold.ttf
  String get montserratBold => 'assets/fonts/Montserrat-Bold.ttf';

  /// File path: assets/fonts/Montserrat-ExtraBold.ttf
  String get montserratExtraBold => 'assets/fonts/Montserrat-ExtraBold.ttf';

  /// File path: assets/fonts/Montserrat-ExtraLight.ttf
  String get montserratExtraLight => 'assets/fonts/Montserrat-ExtraLight.ttf';

  /// File path: assets/fonts/Montserrat-Light.ttf
  String get montserratLight => 'assets/fonts/Montserrat-Light.ttf';

  /// File path: assets/fonts/Montserrat-Medium.ttf
  String get montserratMedium => 'assets/fonts/Montserrat-Medium.ttf';

  /// File path: assets/fonts/Montserrat-Regular.ttf
  String get montserratRegular => 'assets/fonts/Montserrat-Regular.ttf';

  /// File path: assets/fonts/Montserrat-SemiBold.ttf
  String get montserratSemiBold => 'assets/fonts/Montserrat-SemiBold.ttf';

  /// File path: assets/fonts/Montserrat-Thin.ttf
  String get montserratThin => 'assets/fonts/Montserrat-Thin.ttf';

  /// List of all assets
  List<String> get values => [
    montserratBlack,
    montserratBold,
    montserratExtraBold,
    montserratExtraLight,
    montserratLight,
    montserratMedium,
    montserratRegular,
    montserratSemiBold,
    montserratThin,
  ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_face_sad.svg
  String get icFaceSad => 'assets/icons/ic_face_sad.svg';

  /// File path: assets/icons/logo.svg
  String get logo => 'assets/icons/logo.svg';

  /// File path: assets/icons/logo_dev.svg
  String get logoDev => 'assets/icons/logo_dev.svg';

  /// File path: assets/icons/splash.svg
  String get splash => 'assets/icons/splash.svg';

  /// List of all assets
  List<String> get values => [icFaceSad, logo, logoDev, splash];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_alert.jpg
  AssetGenImage get imgAlert =>
      const AssetGenImage('assets/images/img_alert.jpg');

  /// File path: assets/images/img_bg_login.png
  AssetGenImage get imgBgLogin =>
      const AssetGenImage('assets/images/img_bg_login.png');

  /// File path: assets/images/img_bg_sign_up.png
  AssetGenImage get imgBgSignUp =>
      const AssetGenImage('assets/images/img_bg_sign_up.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo_dev.png
  AssetGenImage get logoDev =>
      const AssetGenImage('assets/images/logo_dev.png');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/splash_dev.png
  AssetGenImage get splashDev =>
      const AssetGenImage('assets/images/splash_dev.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    imgAlert,
    imgBgLogin,
    imgBgSignUp,
    logo,
    logoDev,
    splash,
    splashDev,
  ];
}

class $AssetsMdGen {
  const $AssetsMdGen();

  /// File path: assets/md/CHANGELOG.md
  String get changelog => 'assets/md/CHANGELOG.md';

  /// File path: assets/md/LICENSE.md
  String get license => 'assets/md/LICENSE.md';

  /// File path: assets/md/PRIVACY_POLICY.md
  String get privacyPolicy => 'assets/md/PRIVACY_POLICY.md';

  /// File path: assets/md/README.md
  String get readme => 'assets/md/README.md';

  /// List of all assets
  List<String> get values => [changelog, license, privacyPolicy, readme];
}

abstract final class Assets {
  static const String aEnv = '.env';
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsMdGen md = $AssetsMdGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
