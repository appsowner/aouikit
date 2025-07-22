import 'package:flutter/material.dart';
import 'package:aouikit/aouikit.dart';
import 'app_theme_data.dart';

class BrandAppTheme extends StatelessWidget {
  final Widget child;
  const BrandAppTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppTheme(data: appThemeData, child: child);
  }
}
