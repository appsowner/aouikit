import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// AoUiDividerVerticalPadding define el padding vertical del divider.
enum AoUiDividerVerticalPadding { none, s }

/// AoUiDividerHorizontalPadding define el padding horizontal del divider.
enum AoUiDividerHorizontalPadding { none, s, m, l, xl }

/// AoUiDividerType define el tipo de divider.
enum AoUiDividerType { horizontal, vertical }

/// AoUiDivider crea un divider con altura y color por defecto.
///
/// Ejemplo:
/// ```dart
/// AoUiDivider(
///   type: AoUiDividerType.horizontal,
///   color: theme.colors.surfaceContainerLow,
///   verticalPadding: AoUiDividerVerticalPadding.s,
///   horizontalPadding: AoUiDividerHorizontalPadding.s,
/// )
/// ```
class AoUiDivider extends StatelessWidget {
  final AoUiDividerType type;
  final Color? color;
  final AoUiDividerVerticalPadding verticalPadding;
  final AoUiDividerHorizontalPadding horizontalPadding;

  const AoUiDivider({
    super.key,
    this.type = AoUiDividerType.horizontal,
    this.color,
    this.verticalPadding = AoUiDividerVerticalPadding.none,
    this.horizontalPadding = AoUiDividerHorizontalPadding.none,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final dividerColor = color ?? theme.colors.surfaceContainerLow;

    return type == AoUiDividerType.horizontal
        ? Divider(
            thickness: 2,
            color: dividerColor,
            indent: _getHorizontalPadding(),
            endIndent: _getHorizontalPadding(),
          )
        : VerticalDivider(
            thickness: 2,
            color: dividerColor,
            indent: _getVerticalPadding(),
            endIndent: _getVerticalPadding(),
          );
  }

  double _getVerticalPadding() {
    switch (verticalPadding) {
      case AoUiDividerVerticalPadding.none:
        return 0;
      case AoUiDividerVerticalPadding.s:
        return 8;
    }
  }

  double _getHorizontalPadding() {
    switch (horizontalPadding) {
      case AoUiDividerHorizontalPadding.none:
        return 0;
      case AoUiDividerHorizontalPadding.s:
        return 8;
      case AoUiDividerHorizontalPadding.m:
        return 16;
      case AoUiDividerHorizontalPadding.l:
        return 24;
      case AoUiDividerHorizontalPadding.xl:
        return 32;
    }
  }
}
