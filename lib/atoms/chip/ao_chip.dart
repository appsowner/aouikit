import 'package:flutter/material.dart';
import 'package:aouikit/aouikit.dart';

class AoUiChip extends StatelessWidget {
  final String title;
  final AoUiChipSize size;
  final bool highlighted;
  final IconData? leftIcon;
  final Widget? leftIconImage;
  final String? badgeValue;
  final IconData? rightIcon;
  final VoidCallback? onRightIconTap;

  const AoUiChip({
    super.key,
    required this.title,
    this.size = AoUiChipSize.m,
    this.highlighted = false,
    this.leftIcon,
    this.leftIconImage,
    this.badgeValue,
    this.rightIcon,
    this.onRightIconTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final chipContent = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: _getChipDecoration(theme),
          height: size._height,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _getLeftIcon(theme),
              _getLeftIconPaddingIfNeeded(theme),
              Text(title, style: _getTextStyle(theme)),
              _getRightIconPaddingIfNeeded(theme),
              _getDismissOrRightIcon(theme),
            ].whereType<Widget>().toList(),
          ),
        ),
      ],
    );

    if (badgeValue != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Badge(
            label: Text(
              badgeValue!,
              style: size
                  ._getBadgeTextStyle(theme)
                  .copyWith(color: theme.colors.onError),
            ),
            child: chipContent,
          ),
        ],
      );
    } else {
      return chipContent;
    }
  }

  BoxDecoration _getChipDecoration(AppThemeData theme) {
    if (!highlighted) {
      return BoxDecoration(
        border: Border.all(color: theme.colors.outline, width: 1.5),
        borderRadius: BorderRadius.circular(8),
        color: theme.colors.surfaceContainerLow,
      );
    } else {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.colors.secondary,
      );
    }
  }

  Icon _getDismissIcon(AppThemeData theme) {
    return Icon(
      Icons.close,
      color: highlighted ? theme.colors.onSecondary : null,
      size: 12,
    );
  }

  Widget? _getDismissOrRightIcon(AppThemeData theme) {
    if (onRightIconTap != null && rightIcon == null) {
      return GestureDetector(
        onTap: onRightIconTap,
        child: _getDismissIcon(theme),
      );
    } else {
      return _getRightIcon(theme);
    }
  }

  Widget? _getLeftIcon(AppThemeData theme) {
    if (leftIcon != null) {
      return Icon(
        leftIcon!,
        color: highlighted ? theme.colors.onSecondary : theme.colors.onSurface,
      );
    } else if (leftIconImage != null) {
      return leftIconImage;
    } else {
      return null;
    }
  }

  Widget? _getLeftIconPaddingIfNeeded(AppThemeData theme) {
    if (_getLeftIcon(theme) != null) {
      return const SizedBox(width: 11);
    }
    return null;
  }

  Widget? _getRightIcon(AppThemeData theme) {
    if (rightIcon != null) {
      return GestureDetector(
        onTap: onRightIconTap,
        child: Icon(
          rightIcon!,
          color: highlighted ? theme.colors.onSecondary : null,
          size: size._rightIconSize,
        ),
      );
    }
    return null;
  }

  Widget? _getRightIconPaddingIfNeeded(AppThemeData theme) {
    if (_getDismissOrRightIcon(theme) != null) {
      return SizedBox(width: size._rightIconPadding);
    }
    return null;
  }

  TextStyle _getTextStyle(AppThemeData theme) {
    return theme.typography.bodySmall.copyWith(
      color: highlighted ? theme.colors.onSecondary : theme.colors.onSurface,
    );
  }
}

enum AoUiChipSize {
  m(height: 32, rightIconSize: 12, rightIconPadding: 10.25, badgeSize: 16),
  l(height: 40, rightIconSize: 16, rightIconPadding: 13.75, badgeSize: 24);

  const AoUiChipSize({
    required double height,
    required double rightIconSize,
    required double rightIconPadding,
    required double badgeSize,
  }) : _height = height,
       _rightIconSize = rightIconSize,
       _rightIconPadding = rightIconPadding,
       _badgeSize = badgeSize;

  final double _height;
  final double _rightIconSize;
  final double _rightIconPadding;
  final double _badgeSize;

  TextStyle _getBadgeTextStyle(AppThemeData theme) {
    switch (this) {
      case AoUiChipSize.m:
        return theme.typography.bodySmall;
      case AoUiChipSize.l:
        return theme.typography.bodySmall;
    }
  }
}
