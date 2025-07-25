import 'package:flutter/material.dart';

class AoUiSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;

  /// Valor mínimo seleccionable.
  final double min;

  /// Valor máximo seleccionable.
  final double max;

  const AoUiSlider({
    super.key,
    required this.value,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    required this.min,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: min,
      max: max,
      onChanged: onChanged,
      onChangeStart: onChangeStart,
      onChangeEnd: onChangeEnd,
    );
  }
}

/// AoUiRangeSlider es un widget para seleccionar un rango de valores.
///
/// Ejemplo:
/// ```dart
/// AoUiRangeSlider(
///   values: _rangeValues,
///   min: 1.0,
///   max: 10.0,
///   onChanged: (newValues) {
///     setState(() {
///       _rangeValues = newValues;
///     });
///   },
/// )
/// ```
class AoUiRangeSlider extends StatelessWidget {
  final RangeValues values;
  final ValueChanged<RangeValues>? onChanged;
  final ValueChanged<RangeValues>? onChangeStart;
  final ValueChanged<RangeValues>? onChangeEnd;

  final double min;
  final double max;

  const AoUiRangeSlider({
    super.key,
    required this.values,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    required this.min,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: values,
      min: min,
      max: max,
      onChanged: onChanged,
      onChangeStart: onChangeStart,
      onChangeEnd: onChangeEnd,
    );
  }
}
