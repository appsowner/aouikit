import 'package:flutter/material.dart';
import '../aouikit.dart';

class AppThemeData {
  final AoUiColors colors;
  final AoUiTypography typography;
  final AoUiSpacing spacing;
  final AoUiIcons icons;
  final AoUiShapes shapes;
  final ButtonStyles buttonStyles;

  const AppThemeData({
    required this.colors,
    required this.typography,
    required this.spacing,
    required this.buttonStyles,
    AoUiIcons? icons,
    AoUiShapes? shapes,
    AoUiSymbols? symbols,
  }) : icons = icons ?? const AoUiIcons(),
       shapes = shapes ?? const AoUiShapes();

  /// Crea un ThemeData de Flutter basado en los tokens configurados.
  ThemeData toThemeData(Brightness brightness) {
    final colorScheme = colors.toColorScheme(brightness);
    final textTheme = typography.toTextTheme();

    return ThemeData(
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: textTheme,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: buttonStyles.primary.toButtonStyle(shapes.buttonShape),
      ),
      cardTheme: CardThemeData(shape: shapes.cardShape, elevation: 4),
      shadowColor: colorScheme.shadow,
    );
  }
}

extension ButtonColorStyleX on ButtonColorStyle {
  ButtonStyle toButtonStyle(OutlinedBorder shape) {
    return ButtonStyle(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      side: borderSide,
      shape: WidgetStateProperty.all(shape),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashFactory: NoSplash.splashFactory,
    );
  }
}
