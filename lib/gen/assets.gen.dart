/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/blue_pen.png
  AssetGenImage get bluePen => const AssetGenImage('assets/icons/blue_pen.png');

  /// File path: assets/icons/file.png
  AssetGenImage get file => const AssetGenImage('assets/icons/file.png');

  /// File path: assets/icons/flashh.png
  AssetGenImage get flashh => const AssetGenImage('assets/icons/flashh.png');

  /// File path: assets/icons/hashtag.png
  AssetGenImage get hashtag => const AssetGenImage('assets/icons/hashtag.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/icons/icon.png');

  /// File path: assets/icons/microphone.png
  AssetGenImage get microphone =>
      const AssetGenImage('assets/icons/microphone.png');

  /// File path: assets/icons/podcast.png
  AssetGenImage get podcast => const AssetGenImage('assets/icons/podcast.png');

  /// File path: assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/user.png');

  /// File path: assets/icons/writer.png
  AssetGenImage get writer => const AssetGenImage('assets/icons/writer.png');

  /// File path: assets/icons/writing.png
  AssetGenImage get writing => const AssetGenImage('assets/icons/writing.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bluePen,
        file,
        flashh,
        hashtag,
        home,
        icon,
        microphone,
        podcast,
        user,
        writer,
        writing
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/bot.svg
  SvgGenImage get bot => const SvgGenImage('assets/images/bot.svg');

  /// File path: assets/images/img1.png
  AssetGenImage get img1 => const AssetGenImage('assets/images/img1.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/programming.png
  AssetGenImage get programming =>
      const AssetGenImage('assets/images/programming.png');

  /// File path: assets/images/sad.png
  AssetGenImage get sad => const AssetGenImage('assets/images/sad.png');

  /// File path: assets/images/single.png
  AssetGenImage get single => const AssetGenImage('assets/images/single.png');

  /// File path: assets/images/single_place_holder.jpg
  AssetGenImage get singlePlaceHolder =>
      const AssetGenImage('assets/images/single_place_holder.jpg');

  /// List of all assets
  List<dynamic> get values =>
      [avatar, bot, img1, logo, programming, sad, single, singlePlaceHolder];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated Clip? clipBehavior,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
     
      color: color,
      colorBlendMode: colorBlendMode,
     
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
