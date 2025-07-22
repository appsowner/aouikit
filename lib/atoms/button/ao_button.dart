// lib/src/components/button/ao_button.dart

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'button_styles.dart';
import './button_enum.dart';

class AoUiButton extends StatelessWidget {
  final AOUIButtonType type;
  final AOUIButtonSize size;
  final String? label;
  final IconData? iconData;
  final AOUIButtonIconPosition iconPosition;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final double? height;

  const AoUiButton({
    super.key,
    required this.type,
    this.size = AOUIButtonSize.m,
    this.label,
    this.iconData,
    this.iconPosition = AOUIButtonIconPosition.left,
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
      case AOUIButtonType.primary:
        colorStyle = buttonStyles.primary;
        break;
      case AOUIButtonType.secondary:
        colorStyle = buttonStyles.secondary;
        break;
      case AOUIButtonType.outlined:
        colorStyle = buttonStyles.outlined;
        break;
      case AOUIButtonType.ghost:
        colorStyle = buttonStyles.ghost;
        break;
      case AOUIButtonType.danger:
        colorStyle = buttonStyles.danger;
        break;
    }

    final ButtonSizeStyle sizeStyle;
    switch (size) {
      case AOUIButtonSize.xs:
        sizeStyle = buttonStyles.xs;
        break;
      case AOUIButtonSize.s:
        sizeStyle = buttonStyles.s;
        break;
      case AOUIButtonSize.m:
        sizeStyle = buttonStyles.m;
        break;
      case AOUIButtonSize.l:
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
              : (iconData != null &&
                    iconPosition == AOUIButtonIconPosition.left)
              ? sizeStyle.paddingIconToBorder
              : sizeStyle.paddingTextToBorder,
          sizeStyle.paddingVertical,
          label == null
              ? sizeStyle.paddingVertical
              : (iconData != null &&
                    iconPosition == AOUIButtonIconPosition.right)
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
        textDirection: iconPosition == AOUIButtonIconPosition.left
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
