// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/home_icn.png
  AssetGenImage get homeIcn => const AssetGenImage('assets/icons/home_icn.png');

  /// File path: assets/icons/search_icn.png
  AssetGenImage get searchIcn =>
      const AssetGenImage('assets/icons/search_icn.png');

  /// List of all assets
  List<AssetGenImage> get values => [homeIcn, searchIcn];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/business_img.png
  AssetGenImage get businessImg =>
      const AssetGenImage('assets/images/business_img.png');

  /// File path: assets/images/entertainment_img.png
  AssetGenImage get entertainmentImg =>
      const AssetGenImage('assets/images/entertainment_img.png');

  /// File path: assets/images/general_img.png
  AssetGenImage get generalImg =>
      const AssetGenImage('assets/images/general_img.png');

  /// File path: assets/images/health_img.png
  AssetGenImage get healthImg =>
      const AssetGenImage('assets/images/health_img.png');

  /// File path: assets/images/science_img.png
  AssetGenImage get scienceImg =>
      const AssetGenImage('assets/images/science_img.png');

  /// File path: assets/images/splash_img.png
  AssetGenImage get splashImg =>
      const AssetGenImage('assets/images/splash_img.png');

  /// File path: assets/images/sports_img.png
  AssetGenImage get sportsImg =>
      const AssetGenImage('assets/images/sports_img.png');

  /// File path: assets/images/technology_img.png
  AssetGenImage get technologyImg =>
      const AssetGenImage('assets/images/technology_img.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    businessImg,
    entertainmentImg,
    generalImg,
    healthImg,
    scienceImg,
    splashImg,
    sportsImg,
    technologyImg,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
