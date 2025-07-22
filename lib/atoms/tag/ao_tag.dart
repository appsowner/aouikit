import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../theme/app_theme_data.dart';

/// AoUiTag es un widget para crear una etiqueta con contraste, tipo de ícono, tamaño y texto.
class AoUiTag extends StatelessWidget {
  final AoUiTagContrast tagContrast;
  final AoUiTagIconType tagIconType;
  final AoUiTagSize tagSize;
  final String tagText;

  const AoUiTag({
    super.key,
    this.tagContrast = AoUiTagContrast.low,
    required this.tagIconType,
    required this.tagSize,
    required this.tagText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            color: tagContrast._getColor(theme),
          ),
          height: tagSize._getTagSize(),
          padding: EdgeInsets.fromLTRB(
            tagSize._getLeftPadding(tagIconType),
            tagSize._getVerticalPadding(),
            tagSize._getRightPadding(tagIconType),
            tagSize._getVerticalPadding(),
          ),
          child: _getIconAndText(theme),
        ),
      ],
    );
  }

  Widget _getIconAndText(AppThemeData theme) {
    final textColor = tagContrast._getTextColor(theme);
    final textStyle = tagSize._getTextStyle(theme).copyWith(color: textColor);

    switch (tagIconType) {
      case AoUiTagIconType.none:
        return Text(tagText, style: textStyle);
      case AoUiTagIconType.left:
        return Row(
          children: [
            Icon(
              Icons.circle_outlined,
              size: tagSize._getIconSize(),
              color: textColor,
            ),
            SizedBox(width: tagSize._getSpacingBetweenIconAndText()),
            Text(tagText, style: textStyle),
          ],
        );
      case AoUiTagIconType.right:
        return Row(
          children: [
            Text(tagText, style: textStyle),
            SizedBox(width: tagSize._getSpacingBetweenIconAndText()),
            Icon(
              Icons.circle_outlined,
              size: tagSize._getIconSize(),
              color: textColor,
            ),
          ],
        );
    }
  }
}

enum AoUiTagContrast {
  low,
  high;

  Color _getColor(AppThemeData theme) {
    switch (this) {
      case AoUiTagContrast.low:
        return theme.colors.secondary;
      case AoUiTagContrast.high:
        return theme.colors.secondaryContainer;
    }
  }

  Color _getTextColor(AppThemeData theme) {
    switch (this) {
      case AoUiTagContrast.low:
        return theme.colors.onSecondary;
      case AoUiTagContrast.high:
        return theme.colors.secondaryContainer;
    }
  }
}

enum AoUiTagIconType { none, left, right }

enum AoUiTagSize {
  s,
  m,
  l;

  double _getIconSize() {
    switch (this) {
      case AoUiTagSize.s:
        return 12;
      case AoUiTagSize.m:
      case AoUiTagSize.l:
        return 16;
    }
  }

  double _getLeftPadding(AoUiTagIconType iconType) {
    switch (this) {
      case AoUiTagSize.s:
        switch (iconType) {
          case AoUiTagIconType.none:
            return 8;
          case AoUiTagIconType.left:
            return 6;
          case AoUiTagIconType.right:
            return 10;
        }
      case AoUiTagSize.m:
        switch (iconType) {
          case AoUiTagIconType.none:
          case AoUiTagIconType.right:
            return 12;
          case AoUiTagIconType.left:
            return 8;
        }
      case AoUiTagSize.l:
        switch (iconType) {
          case AoUiTagIconType.none:
          case AoUiTagIconType.right:
            return 16;
          case AoUiTagIconType.left:
            return 12;
        }
    }
  }

  double _getRightPadding(AoUiTagIconType iconType) {
    switch (this) {
      case AoUiTagSize.s:
        switch (iconType) {
          case AoUiTagIconType.none:
            return 8;
          case AoUiTagIconType.left:
            return 10;
          case AoUiTagIconType.right:
            return 6;
        }
      case AoUiTagSize.m:
        switch (iconType) {
          case AoUiTagIconType.none:
          case AoUiTagIconType.left:
            return 12;
          case AoUiTagIconType.right:
            return 8;
        }
      case AoUiTagSize.l:
        switch (iconType) {
          case AoUiTagIconType.none:
          case AoUiTagIconType.left:
            return 16;
          case AoUiTagIconType.right:
            return 12;
        }
    }
  }

  double _getSpacingBetweenIconAndText() {
    switch (this) {
      case AoUiTagSize.s:
        return 6;
      case AoUiTagSize.m:
        return 8;
      case AoUiTagSize.l:
        return 10;
    }
  }

  double _getTagSize() {
    switch (this) {
      case AoUiTagSize.s:
        return 24;
      case AoUiTagSize.m:
        return 32;
      case AoUiTagSize.l:
        return 42;
    }
  }

  TextStyle _getTextStyle(AppThemeData theme) {
    switch (this) {
      case AoUiTagSize.s:
        return theme.typography.labelSmall.copyWith(
          fontWeight: FontWeight.w600,
        );
      case AoUiTagSize.m:
        return theme.typography.bodySmall.copyWith(fontWeight: FontWeight.w600);
      case AoUiTagSize.l:
        return theme.typography.bodyMedium.copyWith(
          fontWeight: FontWeight.w600,
        );
    }
  }

  double _getVerticalPadding() {
    switch (this) {
      case AoUiTagSize.s:
        return 5;
      case AoUiTagSize.m:
        return 7;
      case AoUiTagSize.l:
        return 10;
    }
  }
}
