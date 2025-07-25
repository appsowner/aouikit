import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AoUiSuccessCheckMark extends StatelessWidget {
  const AoUiSuccessCheckMark({super.key});

  static const double size = 16;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final colors = theme.colors;
    final icons = theme.icons;

    return Icon(icons.successCheckMark, color: colors.success, size: size);
  }
}
