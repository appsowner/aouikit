import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

enum AoUiFloatingActionButtonSize {
  large(96, 28),
  regular(56, 24),
  small(40, 24);

  const AoUiFloatingActionButtonSize(this.size, this.iconSize);

  final double size;
  final double iconSize;
}

/// AoUiFloatingActionButton es un botón flotante configurable.
///
/// Ejemplo:
/// ```dart
/// AoUiFloatingActionButton(
///   size: AoUiFloatingActionButtonSize.large,
///   iconData: Icons.add,
///   onPressed: () {
///     print('Pressed');
///   },
/// )
/// ```
class AoUiFloatingActionButton extends StatefulWidget {
  const AoUiFloatingActionButton({
    super.key,
    this.size = AoUiFloatingActionButtonSize.regular,
    required this.iconData,
    this.onPressed,
  });

  final AoUiFloatingActionButtonSize size;
  final IconData iconData;
  final VoidCallback? onPressed;

  @override
  State<StatefulWidget> createState() => _AoUiFloatingActionButtonState();
}

class _AoUiFloatingActionButtonState extends State<AoUiFloatingActionButton> {
  bool isPressed = false;

  void _setPressed(bool pressed) {
    if (isPressed != pressed) {
      setState(() {
        isPressed = pressed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    final icon = Icon(widget.iconData, size: widget.size.iconSize);

    final circleBorder = CircleBorder(
      side: isPressed
          ? BorderSide(width: 0.5, color: theme.colors.onSurface)
          : BorderSide.none,
    );

    final backgroundColor = isPressed
        ? theme.colors.primary
        : theme.colors.primaryContainer;

    late final FloatingActionButton fab;

    switch (widget.size) {
      case AoUiFloatingActionButtonSize.large:
        fab = FloatingActionButton.large(
          onPressed: widget.onPressed,
          backgroundColor: backgroundColor,
          shape: circleBorder,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          child: icon,
        );
        break;
      case AoUiFloatingActionButtonSize.regular:
      case AoUiFloatingActionButtonSize.small:
        fab = FloatingActionButton(
          onPressed: widget.onPressed,
          backgroundColor: backgroundColor,
          shape: circleBorder,
          mini: widget.size == AoUiFloatingActionButtonSize.small,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          child: icon,
        );
        break;
    }

    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: fab,
    );
  }
}
