import 'package:flutter/material.dart';
import 'app_theme_data.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData data;

  const AppTheme({super.key, required this.data, required super.child});
  static AppThemeData of(BuildContext context) {
    final AppTheme? inheritedTheme = context
        .dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(inheritedTheme != null, 'No AppTheme found in context');
    return inheritedTheme!.data;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}
