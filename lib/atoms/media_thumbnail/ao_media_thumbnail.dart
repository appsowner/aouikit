import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../theme/app_theme_data.dart';

/// AoUiMediaThumbnail es un widget que muestra una miniatura de un archivo multimedia.
///
/// Ejemplo:
/// ```dart
/// AoUiMediaThumbnail(
///   onPressed: () {
///     print('Miniatura pulsada');
///   },
///   isSelectable: true,
///   size: AoUiMediaThumbnailSize.large,
///   mediaType: AoUiMediaThumbnailType.photo,
///   customThumbnailImage: AoUiImage(
///     image: Image.asset('assets/images/image.png'),
///   ),
/// )
/// ```
class AoUiMediaThumbnail extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool? isSelectable;
  final AoUiMediaThumbnailSize size;
  final AoUiMediaThumbnailType mediaType;
  final Widget? customThumbnailImage;

  const AoUiMediaThumbnail({
    super.key,
    this.onPressed,
    this.isSelectable = true,
    required this.size,
    required this.mediaType,
    this.customThumbnailImage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    if (isSelectable == true) {
      return GestureDetector(onTap: onPressed, child: _getBody(theme));
    } else {
      return _getBody(theme);
    }
  }

  ClipRRect? _getBackgroundImage() {
    if ([
      AoUiMediaThumbnailType.document,
      AoUiMediaThumbnailType.audio,
    ].contains(mediaType)) {
      return null;
    } else if (customThumbnailImage != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: customThumbnailImage,
      );
    } else {
      return null;
    }
  }

  Row _getBody(AppThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              decoration: _decorate(theme),
              height: size.height,
              width: size.width,
            ),
            if (_getBackgroundImage() != null) _getBackgroundImage()!,
            if (_getIsSelectableIcon() != null) _getIsSelectableIcon()!,
            if (_getCenterIconWidget() != null) _getCenterIconWidget()!,
          ],
        ),
      ],
    );
  }

  SizedBox? _getCenterIconWidget() {
    switch (mediaType) {
      case AoUiMediaThumbnailType.document:
        return SizedBox(
          width: size.width,
          height: size.height,
          child: const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: Center(
                child: Icon(Icons.description_outlined, color: Colors.black),
              ),
            ),
          ),
        );
      case AoUiMediaThumbnailType.audio:
        return SizedBox(
          width: size.width,
          height: size.height,
          child: const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: Center(child: Icon(Icons.audiotrack, color: Colors.black)),
            ),
          ),
        );
      case AoUiMediaThumbnailType.video:
        return SizedBox(
          width: size.width,
          height: size.height,
          child: Center(
            child: Container(
              decoration: _decorateIcon(),
              width: 24,
              height: 24,
              child: const Center(
                child: Icon(Icons.play_arrow, color: Colors.white, size: 12),
              ),
            ),
          ),
        );
      case AoUiMediaThumbnailType.photo:
        return null;
    }
  }

  Widget? _getIsSelectableIcon() {
    if (isSelectable == false) {
      return null;
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 4, right: 4),
        child: Container(
          decoration: _decorateIcon(),
          width: 20,
          height: 20,
          child: Center(
            child: Icon(
              _getIsSelectableIconImage(),
              color: Colors.white,
              size: 12,
            ),
          ),
        ),
      );
    }
  }

  IconData _getIsSelectableIconImage() {
    return (mediaType == AoUiMediaThumbnailType.audio)
        ? Icons.play_circle_outline
        : Icons.remove_red_eye;
  }

  BoxDecoration _decorateIcon() {
    return const BoxDecoration(
      color: Color.fromARGB(153, 0, 0, 0),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );
  }

  BoxDecoration _decorate(AppThemeData theme) {
    return BoxDecoration(
      color: theme.colors.onSecondaryContainer,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
  }
}

enum AoUiMediaThumbnailSize {
  large(80, 60),
  regular(52, 40);

  const AoUiMediaThumbnailSize(this.width, this.height);

  final double width;
  final double height;
}

enum AoUiMediaThumbnailType { photo, video, document, audio }
