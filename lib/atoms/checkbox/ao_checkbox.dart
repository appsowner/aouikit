import 'package:flutter/material.dart';

import '../../aouikit.dart';

enum AOUICheckBoxState {
  unchecked(0),
  mixed(1),
  checked(2);

  const AOUICheckBoxState(this.value);
  final int value;

  static AOUICheckBoxState getByValue(int i) {
    return AOUICheckBoxState.values.firstWhere((x) => x.value == i);
  }
}

class AoCheckBox extends StatefulWidget {
  final bool enableMixedState;
  final AOUICheckBoxState state;
  final ValueChanged<AOUICheckBoxState>? onChanged;

  const AoCheckBox({
    super.key,
    this.state = AOUICheckBoxState.unchecked,
    this.enableMixedState = false,
    this.onChanged,
  });

  @override
  State<AoCheckBox> createState() => _AOUICheckBoxState();
}

class _AOUICheckBoxState extends State<AoCheckBox> {
  late AOUICheckBoxState state;

  @override
  void initState() {
    super.initState();
    state = widget.state;
  }

  void _toggleState() {
    setState(() {
      if (widget.enableMixedState) {
        int rawValue = state.value;
        state = AOUICheckBoxState.getByValue((rawValue + 1) % 3);
      } else {
        state = (state == AOUICheckBoxState.unchecked)
            ? AOUICheckBoxState.checked
            : AOUICheckBoxState.unchecked;
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
    if (state == AOUICheckBoxState.unchecked) {
      backgroundColor = null;
    } else {
      backgroundColor = widget.onChanged != null
          ? theme.colors.primary
          : theme.colors.disabledBackground;
    }

    IconData? iconData;
    switch (state) {
      case AOUICheckBoxState.unchecked:
        iconData = null;
        break;
      case AOUICheckBoxState.checked:
        iconData = Icons.check; // Puedes usar otro icono si quieres
        break;
      case AOUICheckBoxState.mixed:
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
          border: state == AOUICheckBoxState.unchecked
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
