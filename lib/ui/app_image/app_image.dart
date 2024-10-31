import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType { svg, image, file }

enum ImageProviderType { network, asset }

class AppImage extends StatelessWidget {
  final double height;
  final double width;
  final double? size;
  final String asset;
  final ImageType type;
  final ImageProviderType providerType;
  final Color? color;
  final BoxFit? fit;
  final ColorFilter? colorFilter;
  final String? errorAsset;

  const AppImage({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.type = ImageType.image,
    this.providerType = ImageProviderType.asset,
    this.asset = '',
    this.color,
    this.fit,
    this.colorFilter,
    this.errorAsset,
  });

  const AppImage.assetImage({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.type = ImageType.image,
    this.providerType = ImageProviderType.asset,
    this.asset = '',
    this.color,
    this.fit,
    this.colorFilter,
    this.errorAsset,
  });

  const AppImage.assetSvg({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.type = ImageType.svg,
    this.providerType = ImageProviderType.asset,
    this.asset = '',
    this.color,
    this.fit,
    this.colorFilter,
    this.errorAsset,
  });

  const AppImage.assetFile({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.type = ImageType.file,
    this.providerType = ImageProviderType.asset,
    this.asset = '',
    this.color,
    this.fit,
    this.colorFilter,
    this.errorAsset,
  });

  const AppImage.network({
    super.key,
    this.height = 157,
    this.width = 237,
    this.size,
    this.type = ImageType.image,
    this.providerType = ImageProviderType.network,
    this.asset = '',
    this.color,
    this.fit,
    this.colorFilter,
    this.errorAsset = 'assets/images/image_placeholder.png',
  });

  @override
  Widget build(BuildContext context) {
    if (asset.isEmpty) {
      return Image.asset(
        'assets/images/image_placeholder.png',
        width: size ?? width,
        height: size ?? height,
        color: color,
        fit: fit,
      );
    }
    if (providerType == ImageProviderType.asset && type == ImageType.svg) {
      return SvgPicture.asset(
        asset,
        width: size ?? width,
        height: size ?? height,
        fit: fit ?? BoxFit.contain,
        colorFilter: colorFilter ??
            (color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null),
      );
    }
    if (providerType == ImageProviderType.asset && type == ImageType.image) {
      return Image.asset(
        asset,
        width: size ?? width,
        height: size ?? height,
        color: color,
        fit: fit,
      );
    }
    if (providerType == ImageProviderType.asset && type == ImageType.file) {
      return Image.file(
        File(asset),
        width: size ?? width,
        height: size ?? height,
        color: color,
        fit: fit,
      );
    }
    if (providerType == ImageProviderType.network && colorFilter != null) {
      return ColorFiltered(
        colorFilter: colorFilter!,
        child: FadeInImage(
          width: size ?? width,
          height: size ?? height,
          fit: fit,
          placeholder: const AssetImage('assets/images/image_placeholder.png'),
          imageErrorBuilder: (context, error, stackTrace) =>
              Image.asset(
                errorAsset ?? 'assets/images/image_placeholder.png',
                width: size ?? width,
                height: size ?? height,
                color: color,
                fit: fit,
              ),
          image: CachedNetworkImageProvider(asset),
          color: color,
        ),
      );
    }
    if (providerType == ImageProviderType.network) {
      return FadeInImage(
        width: size ?? width,
        height: size ?? height,
        fit: fit,
        placeholder: const AssetImage(
          'assets/images/image_placeholder.png',
        ),
        imageErrorBuilder: (context, error, stackTrace) =>
            Image.asset(
              errorAsset ?? 'assets/images/image_placeholder.png',
              width: size ?? width,
              height: size ?? height,
              color: color,
              fit: fit,
            ),
        image: CachedNetworkImageProvider(asset),
        color: color,
      );
    }
    return const SizedBox();
  }
}
