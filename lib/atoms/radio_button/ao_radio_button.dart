import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../theme/app_theme_data.dart';

class AoUiRadioButton extends StatelessWidget {
  final ValueChanged<bool>? onPressed;
  final bool isSelected;

  const AoUiRadioButton({super.key, this.onPressed, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return GestureDetector(
      onTap: () {
        onPressed?.call(!isSelected);
      },
      child: Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _getOuterContainerColor(theme),
          border: _getOuterBorder(theme),
          shape: BoxShape.circle,
        ),
        child: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _getInnerContainerColor(theme),
          ),
        ),
      ),
    );
  }

  Color? _getInnerContainerColor(AppThemeData theme) {
    if (isSelected) {
      return onPressed != null
          ? theme.colors.onPrimary
          : theme.colors.disabledContent;
    }
    return null;
  }

  Color? _getOuterContainerColor(AppThemeData theme) {
    if (isSelected) {
      return onPressed != null
          ? theme.colors.primary
          : theme.colors.disabledBackground;
    }
    return null;
  }

  Border? _getOuterBorder(AppThemeData theme) {
    if (!isSelected) {
      return Border.all(width: 1.5, color: _getOuterBorderColor(theme));
    }
    return null;
  }

  Color _getOuterBorderColor(AppThemeData theme) {
    return onPressed != null
        ? theme.colors.outline
        : theme.colors.disabledContent;
  }
}
