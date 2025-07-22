import 'package:aouikit/aouikit.dart';
import 'brand_colors.dart';
import 'brand_typography.dart';
import 'brand_spacing.dart';
import 'brand_button_styles.dart';

final appThemeData = AppThemeData(
  colors: brandColors,
  typography: brandTypography,
  spacing: brandSpacing,
  shapes: AoUiShapes(),
  icons: AoUiIcons(),
  symbols: AoUiSymbols(),
  buttonStyles: brandButtonStyles,
);
