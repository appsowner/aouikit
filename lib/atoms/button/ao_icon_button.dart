// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:aouikit/aouikit.dart';

enum AoUiIconButtonType { primary, secondary, outlined, ghost }

enum AoUiIconButtonSize {
  s(size: 32, iconSize: 16),
  m(size: 40, iconSize: 20),
  l(size: 48, iconSize: 24);

  const AoUiIconButtonSize({required this.size, required this.iconSize});
  final double size;
  final double iconSize;
}

class AoUiIconButton extends StatelessWidget {
  const AoUiIconButton({
    super.key,
    required this.type,
    required this.size,
    required this.iconData,
    this.onPressed,
    this.onLongPress,
  });

  final AoUiIconButtonType type;
  final AoUiIconButtonSize size;
  final IconData iconData;

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final buttonStyles = theme.buttonStyles;

    // Selecciona el estilo según el tipo
    final ButtonColorStyle colorStyle = switch (type) {
      AoUiIconButtonType.primary => buttonStyles.primary,
      AoUiIconButtonType.secondary => buttonStyles.secondary,
      AoUiIconButtonType.outlined => buttonStyles.outlined,
      AoUiIconButtonType.ghost => buttonStyles.ghost,
    };

    final ButtonStyle buttonStyle = ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      backgroundColor: colorStyle.backgroundColor,
      foregroundColor: colorStyle.foregroundColor,
      side: colorStyle.borderSide,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: MaterialStateProperty.all(const CircleBorder()),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      splashFactory: NoSplash.splashFactory,
      fixedSize: MaterialStateProperty.all(Size.square(size.size)),
      minimumSize: MaterialStateProperty.all(const Size(0, 0)),
      alignment: Alignment.center,
      iconColor: colorStyle.foregroundColor,
      iconSize: MaterialStateProperty.all(size.iconSize),
    );

    return Container(
      margin: const EdgeInsets.all(5),
      child: TextButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: buttonStyle,
        child: Icon(iconData),
      ),
    );
  }
}
