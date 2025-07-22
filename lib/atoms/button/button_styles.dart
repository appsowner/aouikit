import 'package:flutter/material.dart';

class ButtonColorStyle {
  final WidgetStateProperty<Color?> backgroundColor;
  final WidgetStateProperty<Color?> foregroundColor;
  final WidgetStateProperty<BorderSide?> borderSide;

  ButtonColorStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderSide,
  });
}

class ButtonSizeStyle {
  final TextStyle textStyle;
  final double iconSize;
  final double paddingVertical;
  final double paddingTextToBorder;
  final double paddingIconToBorder;
  final double paddingTextToIcon;

  ButtonSizeStyle({
    required this.textStyle,
    required this.iconSize,
    required this.paddingVertical,
    required this.paddingTextToBorder,
    required this.paddingIconToBorder,
    required this.paddingTextToIcon,
  });
}

class ButtonStyles {
  final ButtonColorStyle primary;
  final ButtonColorStyle secondary;
  final ButtonColorStyle outlined;
  final ButtonColorStyle ghost;
  final ButtonColorStyle danger;

  final ButtonSizeStyle xs;
  final ButtonSizeStyle s;
  final ButtonSizeStyle m;
  final ButtonSizeStyle l;

  ButtonStyles({
    required this.primary,
    required this.secondary,
    required this.outlined,
    required this.ghost,
    required this.danger,
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
  });
}

enum AoUIconButtonType { primary, secondary, outlined, ghost }

/// AoUIconButtonSize is used to define the size of button.
enum AoUIconButtonSize {
  px20(20, 12),
  px24(24, 12),
  px32(32, 24),
  px40(40, 24),
  px48(48, 24);

  const AoUIconButtonSize(this.size, this.iconSize);

  final double size;
  final double iconSize;
}

/// TUIButtonIconAlignment is used to define the alignment of icon in button.
enum AoUIButtonIconAlignment { left, right, none }
