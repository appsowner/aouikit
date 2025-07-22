import 'package:flutter/material.dart';

/// Interfaz para proveer iconos en el sistema de diseño.
abstract class IconProvider {
  IconData get chevronDown;
  IconData get chevronRight;
  IconData get chevronLeft;
  IconData get reorderDots;
  IconData get successCheckMark;
  IconData get information;
  IconData get warning;
  IconData get error;
}

/// Implementación por defecto usando MaterialIcons con constructor const.
class MaterialIconProvider implements IconProvider {
  const MaterialIconProvider();

  @override
  IconData get chevronDown => Icons.keyboard_arrow_down;

  @override
  IconData get chevronRight => Icons.keyboard_arrow_right;

  @override
  IconData get chevronLeft => Icons.keyboard_arrow_left;

  @override
  IconData get reorderDots => Icons.drag_handle;

  @override
  IconData get successCheckMark => Icons.check_circle;

  @override
  IconData get information => Icons.info;

  @override
  IconData get warning => Icons.warning;

  @override
  IconData get error => Icons.error;
}

/// Clase que usa un proveedor de iconos para exponer los iconos configurables.
class AoUiIcons {
  final IconProvider provider;

  const AoUiIcons({IconProvider? provider})
    : provider = provider ?? const MaterialIconProvider();

  IconData get chevronDown => provider.chevronDown;
  IconData get chevronRight => provider.chevronRight;
  IconData get chevronLeft => provider.chevronLeft;
  IconData get reorderDots => provider.reorderDots;
  IconData get successCheckMark => provider.successCheckMark;
  IconData get information => provider.information;
  IconData get warning => provider.warning;
  IconData get error => provider.error;
}
