import 'package:flutter/material.dart';

class AoUiSymbols {
  // Radios de borde estándar
  final double borderRadiusSmall;
  final double borderRadiusMedium;
  final double borderRadiusLarge;

  // Duraciones de animación estándar
  final Duration animationShort;
  final Duration animationMedium;
  final Duration animationLong;

  // Opacidades comunes para estados
  final double disabledOpacity;
  final double hoverOpacity;
  final double focusOpacity;

  // Elevaciones (sombras) estándar
  final List<BoxShadow> shadowLow;
  final List<BoxShadow> shadowHigh;

  // Constructor
  const AoUiSymbols({
    this.borderRadiusSmall = 4.0,
    this.borderRadiusMedium = 8.0,
    this.borderRadiusLarge = 16.0,
    this.animationShort = const Duration(milliseconds: 150),
    this.animationMedium = const Duration(milliseconds: 300),
    this.animationLong = const Duration(milliseconds: 600),
    this.disabledOpacity = 0.38,
    this.hoverOpacity = 0.08,
    this.focusOpacity = 0.12,
    this.shadowLow = const [
      BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
    ],
    this.shadowHigh = const [
      BoxShadow(color: Colors.black38, blurRadius: 8, offset: Offset(0, 4)),
    ],
  });
}
