import 'package:flutter/material.dart';

import '../../aouikit.dart';

class AOUIAnchor extends StatefulWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isActive;

  const AOUIAnchor({
    super.key,
    required this.title,
    this.onPressed,
    this.isActive = false,
  });

  @override
  State<AOUIAnchor> createState() => _AOUIAnchorState();
}

class _AOUIAnchorState extends State<AOUIAnchor> {
  bool isPressed = false;

  void _setPressed(bool pressed) {
    setState(() {
      isPressed = pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    // El rectángulo se pinta si está activo o presionado
    final bool showActive = widget.isActive || isPressed;
    final Color? rectangleColor = showActive ? theme.colors.secondary : null;

    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) {
        _setPressed(false);
        widget.onPressed?.call();
      },
      onTapCancel: () => _setPressed(false),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(height: 24.0, width: 4.0, color: rectangleColor),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 10, 10, 10),
              child: Text(
                widget.title,
                style: theme.typography.bodyMedium.copyWith(
                  color: theme.colors.outline,
                ),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
