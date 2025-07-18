import 'package:flutter/material.dart';

import '../../aouikit.dart';

enum AoCheckBoxState {
  unchecked(0),
  mixed(1),
  checked(2);

  const AoCheckBoxState(this.value);
  final int value;

  static AoCheckBoxState getByValue(int i) {
    return AoCheckBoxState.values.firstWhere((x) => x.value == i);
  }
}

class AoCheckBox extends StatefulWidget {
  final bool enableMixedState;
  final AoCheckBoxState state;
  final ValueChanged<AoCheckBoxState>? onChanged;

  const AoCheckBox({
    super.key,
    this.state = AoCheckBoxState.unchecked,
    this.enableMixedState = false,
    this.onChanged,
  });

  @override
  State<AoCheckBox> createState() => _AoCheckBoxState();
}

class _AoCheckBoxState extends State<AoCheckBox> {
  late AoCheckBoxState state;

  @override
  void initState() {
    super.initState();
    state = widget.state;
  }

  void _toggleState() {
    setState(() {
      if (widget.enableMixedState) {
        int rawValue = state.value;
        state = AoCheckBoxState.getByValue((rawValue + 1) % 3);
      } else {
        state = (state == AoCheckBoxState.unchecked)
            ? AoCheckBoxState.checked
            : AoCheckBoxState.unchecked;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    Color borderColor = widget.onChanged != null
        ? theme.colors.outline
        : theme.colors.disabledContent;

    Color? backgroundColor;
    if (state == AoCheckBoxState.unchecked) {
      backgroundColor = null;
    } else {
      backgroundColor = widget.onChanged != null
          ? theme.colors.primary
          : theme.colors.disabledBackground;
    }

    IconData? iconData;
    switch (state) {
      case AoCheckBoxState.unchecked:
        iconData = null;
        break;
      case AoCheckBoxState.checked:
        iconData = Icons.check; // Puedes usar otro icono si quieres
        break;
      case AoCheckBoxState.mixed:
        iconData = Icons.remove; // Icono para estado mixto
        break;
    }

    Color iconColor = widget.onChanged != null
        ? theme.colors.onPrimary
        : theme.colors.disabledContent;

    return GestureDetector(
      onTap: () {
        if (widget.onChanged != null) {
          _toggleState();
          widget.onChanged!(state);
        }
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: backgroundColor,
          border: state == AoCheckBoxState.unchecked
              ? Border.all(width: 1.5, color: borderColor)
              : null,
        ),
        child: iconData != null
            ? Icon(iconData, color: iconColor, size: 18)
            : null,
      ),
    );
  }
}
