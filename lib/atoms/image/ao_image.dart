import 'package:flutter/material.dart';

class AoUIImage extends StatelessWidget {
  final String? _imageUrl;
  final String? _assetPath;
  final double? _width;
  final double? _height;
  final BoxFit? _fit;

  const AoUIImage({
    super.key,
    String? imageUrl,
    String? assetPath,
    double? width,
    double? height,
    BoxFit? fit,
  }) : _assetPath = assetPath,
       _imageUrl = imageUrl,
       _width = width,
       _height = height,
       _fit = fit,
       assert(
         imageUrl != null || assetPath != null,
         'imageUrl or assetPath must be provided.',
       );

  @override
  Image build(BuildContext context) {
    if (_assetPath != null) {
      return Image.asset(
        _assetPath!,
        width: _width,
        height: _height,
        fit: _fit,
      );
    } else {
      return Image.network(
        _imageUrl!,
        width: _width,
        height: _height,
        fit: _fit,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
              return const Text('Failed to load image');
            },
      );
    }
  }
}
