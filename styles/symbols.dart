import 'package:flutter/material.dart';

class AoUiSymbols {
  AoUiSymbols._(); // Constructor privado para evitar instancias

  // Radios de borde estándar
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 16.0;

  // Duraciones de animación estándar
  static const Duration animationShort = Duration(milliseconds: 150);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationLong = Duration(milliseconds: 600);

  // Opacidades comunes para estados
  static const double disabledOpacity = 0.38;
  static const double hoverOpacity = 0.08;
  static const double focusOpacity = 0.12;

  // Elevaciones (sombras) estándar
  static final List<BoxShadow> shadowLow = [
    BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
  ];

  static final List<BoxShadow> shadowHigh = [
    BoxShadow(color: Colors.black38, blurRadius: 8, offset: Offset(0, 4)),
  ];

  // Otros símbolos o constantes que quieras agregar
}
