import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// AoUiDraggableCard es una tarjeta que puede ser arrastrada y soltada.
///
/// Ejemplo:
/// ```dart
/// AoUiDraggableCard(
///   child: Text('Hola Mundo'),
/// )
/// ```
class AoUiDraggableCard extends StatelessWidget {
  final Widget child;
  final bool backgroundDark;

  const AoUiDraggableCard({
    super.key,
    required this.child,
    this.backgroundDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: _getBoxDecoration(context),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.drag_handle, // Icono estándar para "reorder"
            ),
          ),
          child,
        ],
      ),
    );
  }

  BoxDecoration _getBoxDecoration(BuildContext context) {
    final theme = AppTheme.of(context);
    Color background = Colors.transparent;

    if (backgroundDark) {
      background = theme
          .colors
          .surfaceContainerLow; // Usa un color de fondo oscuro de tu tema
    }

    return BoxDecoration(
      color: background,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
    );
  }
}
