// lib/src/components/button/ao_button.dart

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'button_styles.dart';
import './button_enum.dart';

class AoButton extends StatelessWidget {
  final AoButtonType type;
  final AoButtonSize size;
  final String? label;
  final IconData? iconData;
  final AoButtonIconPosition iconPosition;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final double? height;

  const AoButton({
    super.key,
    required this.type,
    this.size = AoButtonSize.m,
    this.label,
    this.iconData,
    this.iconPosition = AoButtonIconPosition.left,
    required this.onPressed,
    this.onLongPress,
    this.height,
  }) : assert(label != null || iconData != null);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final buttonStyles = theme.buttonStyles;
    final ButtonColorStyle colorStyle;
    switch (type) {
      case AoButtonType.primary:
        colorStyle = buttonStyles.primary;
        break;
      case AoButtonType.secondary:
        colorStyle = buttonStyles.secondary;
        break;
      case AoButtonType.outlined:
        colorStyle = buttonStyles.outlined;
        break;
      case AoButtonType.ghost:
        colorStyle = buttonStyles.ghost;
        break;
      case AoButtonType.danger:
        colorStyle = buttonStyles.danger;
        break;
    }

    final ButtonSizeStyle sizeStyle;
    switch (size) {
      case AoButtonSize.xs:
        sizeStyle = buttonStyles.xs;
        break;
      case AoButtonSize.s:
        sizeStyle = buttonStyles.s;
        break;
      case AoButtonSize.m:
        sizeStyle = buttonStyles.m;
        break;
      case AoButtonSize.l:
        sizeStyle = buttonStyles.l;
        break;
    }

    final buttonStyle = ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      backgroundColor: colorStyle.backgroundColor,
      foregroundColor: colorStyle.foregroundColor,
      side: colorStyle.borderSide,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: MaterialStateProperty.all(
        label != null ? const StadiumBorder() : const CircleBorder(),
      ),
      splashFactory: NoSplash.splashFactory,
      fixedSize: MaterialStateProperty.all(
        Size.fromHeight(height ?? sizeStyle.paddingVertical * 3),
      ),
      minimumSize: MaterialStateProperty.all(const Size(0, 0)),
      alignment: Alignment.center,
      padding: MaterialStateProperty.all(
        EdgeInsets.fromLTRB(
          label == null
              ? sizeStyle.paddingVertical
              : (iconData != null && iconPosition == AoButtonIconPosition.left)
              ? sizeStyle.paddingIconToBorder
              : sizeStyle.paddingTextToBorder,
          sizeStyle.paddingVertical,
          label == null
              ? sizeStyle.paddingVertical
              : (iconData != null && iconPosition == AoButtonIconPosition.right)
              ? sizeStyle.paddingIconToBorder
              : sizeStyle.paddingTextToBorder,
          sizeStyle.paddingVertical,
        ),
      ),
      textStyle: MaterialStateProperty.all(sizeStyle.textStyle),
      iconColor: colorStyle.foregroundColor,
      iconSize: MaterialStateProperty.all(sizeStyle.iconSize),
    );

    Widget buttonChild;
    if (label != null && iconData != null) {
      buttonChild = Row(
        textDirection: iconPosition == AoButtonIconPosition.left
            ? TextDirection.ltr
            : TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData),
          SizedBox(width: sizeStyle.paddingTextToIcon),
          Text(label!),
        ],
      );
    } else if (label != null) {
      buttonChild = Text(label!);
    } else {
      buttonChild = Icon(iconData);
    }

    return TextButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: buttonStyle,
      child: buttonChild,
    );
  }
}
