/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Aksesoris.png
  AssetGenImage get aksesoris =>
      const AssetGenImage('assets/images/Aksesoris.png');

  /// File path: assets/images/Alat Dapur.png
  AssetGenImage get alatDapur =>
      const AssetGenImage('assets/images/Alat Dapur.png');

  /// File path: assets/images/Buku.png
  AssetGenImage get buku => const AssetGenImage('assets/images/Buku.png');

  /// File path: assets/images/Dekorasi.png
  AssetGenImage get dekorasi =>
      const AssetGenImage('assets/images/Dekorasi.png');

  /// File path: assets/images/Elektronik.png
  AssetGenImage get elektronik =>
      const AssetGenImage('assets/images/Elektronik.png');

  /// File path: assets/images/Handcraft.png
  AssetGenImage get handcraft =>
      const AssetGenImage('assets/images/Handcraft.png');

  /// File path: assets/images/Hobi.png
  AssetGenImage get hobi => const AssetGenImage('assets/images/Hobi.png');

  /// File path: assets/images/Koleksi.png
  AssetGenImage get koleksi => const AssetGenImage('assets/images/Koleksi.png');

  /// File path: assets/images/Olahraga.png
  AssetGenImage get olahraga =>
      const AssetGenImage('assets/images/Olahraga.png');

  /// File path: assets/images/Pakaian.png
  AssetGenImage get pakaian => const AssetGenImage('assets/images/Pakaian.png');

  /// File path: assets/images/Perabot RT.png
  AssetGenImage get perabotRT =>
      const AssetGenImage('assets/images/Perabot RT.png');

  /// File path: assets/images/banner.jpg
  AssetGenImage get banner => const AssetGenImage('assets/images/banner.jpg');

  /// File path: assets/images/burger1.jpg
  AssetGenImage get burger1 => const AssetGenImage('assets/images/burger1.jpg');

  /// File path: assets/images/cube1.png
  AssetGenImage get cube1 => const AssetGenImage('assets/images/cube1.png');

  /// File path: assets/images/fox1.png
  AssetGenImage get fox1 => const AssetGenImage('assets/images/fox1.png');

  /// File path: assets/images/fox2.png
  AssetGenImage get fox2 => const AssetGenImage('assets/images/fox2.png');

  /// File path: assets/images/fox3.png
  AssetGenImage get fox3 => const AssetGenImage('assets/images/fox3.png');

  /// File path: assets/images/fox4.png
  AssetGenImage get fox4 => const AssetGenImage('assets/images/fox4.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/user.jpg
  AssetGenImage get user => const AssetGenImage('assets/images/user.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        aksesoris,
        alatDapur,
        buku,
        dekorasi,
        elektronik,
        handcraft,
        hobi,
        koleksi,
        olahraga,
        pakaian,
        perabotRT,
        banner,
        burger1,
        cube1,
        fox1,
        fox2,
        fox3,
        fox4,
        logo,
        user
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
