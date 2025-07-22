import 'package:flutter/material.dart';

/// Tokens de formas configurables para el sistema de diseño.
/// Alineados con las formas de Material 3.
class AoUiShapes {
  // Radios de borde estándar
  final BorderRadiusGeometry smallBorderRadius;
  final BorderRadiusGeometry mediumBorderRadius;
  final BorderRadiusGeometry largeBorderRadius;

  // Formas para componentes específicos (ej. botones, tarjetas, chips)
  final OutlinedBorder buttonShape;
  final OutlinedBorder cardShape;
  final OutlinedBorder chipShape;
  final OutlinedBorder dialogShape;
  final OutlinedBorder bottomSheetShape;

  const AoUiShapes({
    // Valores por defecto que puedes personalizar
    this.smallBorderRadius = const BorderRadius.all(Radius.circular(4.0)),
    this.mediumBorderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.largeBorderRadius = const BorderRadius.all(Radius.circular(16.0)),
    this.buttonShape = const StadiumBorder(), // Botones con bordes redondeados
    this.cardShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    this.chipShape = const StadiumBorder(),
    this.dialogShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28.0)),
    ),
    this.bottomSheetShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
    ),
  });
}
