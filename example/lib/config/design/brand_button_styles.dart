import 'package:flutter/material.dart';
import 'package:aouikit/aouikit.dart';

final brandButtonStyles = ButtonStyles(
  // ESTILOS DE COLOR
  primary: ButtonColorStyle(
    backgroundColor: WidgetStateProperty.all(const Color(0xFF0057B8)),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    borderSide: WidgetStateProperty.all(BorderSide.none),
  ),

  secondary: ButtonColorStyle(
    backgroundColor: WidgetStateProperty.all(const Color(0xFFFFB300)),
    foregroundColor: WidgetStateProperty.all(Colors.black),
    borderSide: WidgetStateProperty.all(BorderSide.none),
  ),

  outlined: ButtonColorStyle(
    backgroundColor: WidgetStateProperty.all(Colors.transparent),
    foregroundColor: WidgetStateProperty.all(const Color(0xFF0057B8)),
    borderSide: WidgetStateProperty.all(
      const BorderSide(color: Color(0xFF0057B8), width: 1.0),
    ),
  ),

  ghost: ButtonColorStyle(
    backgroundColor: WidgetStateProperty.all(Colors.transparent),
    foregroundColor: WidgetStateProperty.all(const Color(0xFF0057B8)),
    borderSide: WidgetStateProperty.all(BorderSide.none),
  ),

  danger: ButtonColorStyle(
    backgroundColor: WidgetStateProperty.all(const Color(0xFFD32F2F)),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    borderSide: WidgetStateProperty.all(BorderSide.none),
  ),

  // ESTILOS DE TAMAÑO
  xs: ButtonSizeStyle(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
    ),
    iconSize: 16.0,
    paddingVertical: 4.0,
    paddingTextToBorder: 8.0,
    paddingIconToBorder: 6.0,
    paddingTextToIcon: 4.0,
  ),

  s: ButtonSizeStyle(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
    ),
    iconSize: 18.0,
    paddingVertical: 6.0,
    paddingTextToBorder: 12.0,
    paddingIconToBorder: 8.0,
    paddingTextToIcon: 6.0,
  ),

  m: ButtonSizeStyle(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
    ),
    iconSize: 20.0,
    paddingVertical: 8.0,
    paddingTextToBorder: 16.0,
    paddingIconToBorder: 12.0,
    paddingTextToIcon: 8.0,
  ),

  l: ButtonSizeStyle(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
    ),
    iconSize: 24.0,
    paddingVertical: 12.0,
    paddingTextToBorder: 20.0,
    paddingIconToBorder: 16.0,
    paddingTextToIcon: 10.0,
  ),
);
