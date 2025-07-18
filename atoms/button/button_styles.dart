// lib/src/components/button/button_styles.dart

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
