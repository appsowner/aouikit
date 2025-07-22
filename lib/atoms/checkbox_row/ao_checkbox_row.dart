import 'package:flutter/material.dart';
import 'package:aouikit/aouikit.dart';

enum AoUiCheckBoxRowState {
  unchecked(0),
  mixed(1),
  checked(2);

  const AoUiCheckBoxRowState(this.value);
  final int value;

  static AoUiCheckBoxRowState getByValue(int i) {
    return AoUiCheckBoxRowState.values.firstWhere((x) => x.value == i);
  }
}

class AoUiCheckBoxRow extends StatefulWidget {
  final String title;
  final String description;
  final bool backgroundDark;
  final bool enableMixedState;
  final AoUiCheckBoxRowState state;
  final ValueChanged<AoUiCheckBoxRowState>? onChanged;

  const AoUiCheckBoxRow({
    super.key,
    this.enableMixedState = false,
    this.state = AoUiCheckBoxRowState.unchecked,
    required this.title,
    this.description = "",
    this.onChanged,
    this.backgroundDark = false,
  });

  @override
  State<AoUiCheckBoxRow> createState() => _AoUiCheckBoxRowState();
}

class _AoUiCheckBoxRowState extends State<AoUiCheckBoxRow> {
  late AoUiCheckBoxRowState state;
  late bool _enableMixedState;

  @override
  void initState() {
    super.initState();
    state = widget.state;
    _enableMixedState =
        widget.enableMixedState || state == AoUiCheckBoxRowState.mixed;
  }

  void _toggleState() {
    setState(() {
      if (_enableMixedState) {
        int rawValue = state.value;
        state = AoUiCheckBoxRowState.getByValue((rawValue + 1) % 3);
      } else {
        state = (state == AoUiCheckBoxRowState.unchecked)
            ? AoUiCheckBoxRowState.checked
            : AoUiCheckBoxRowState.unchecked;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final showDescription = widget.description.isNotEmpty;

    return GestureDetector(
      onTap: widget.onChanged == null
          ? null
          : () {
              _toggleState();
              widget.onChanged?.call(state);
            },
      child: Container(
        decoration: _getBoxDecorationRow(theme),
        padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: showDescription
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              margin: EdgeInsets.only(top: showDescription ? 3.0 : 0.0),
              decoration: _getBoxDecoration(theme),
              child: _getIcon(theme),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: theme.typography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (showDescription)
                  Text(widget.description, style: theme.typography.bodyMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _getBoxDecorationRow(AppThemeData theme) {
    Color backgroundColor = Colors.transparent;
    if (widget.backgroundDark) {
      backgroundColor = theme.colors.surfaceContainerLow;
    }
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
    );
  }

  BoxDecoration _getBoxDecoration(AppThemeData theme) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: _getCheckboxBackgroundColor(theme),
      border: _getCheckboxBorder(theme),
    );
  }

  Border? _getCheckboxBorder(AppThemeData theme) {
    final borderColor = widget.onChanged != null
        ? theme.colors.outline
        : theme.colors.disabledContent;
    return (state == AoUiCheckBoxRowState.unchecked)
        ? Border.all(width: 1.5, color: borderColor)
        : null;
  }

  Color? _getCheckboxBackgroundColor(AppThemeData theme) {
    if (state == AoUiCheckBoxRowState.unchecked) return null;
    return widget.onChanged != null
        ? theme.colors.primary
        : theme.colors.disabledBackground;
  }

  Widget? _getIcon(AppThemeData theme) {
    if (state == AoUiCheckBoxRowState.unchecked) return null;

    IconData iconData;
    if (state == AoUiCheckBoxRowState.checked) {
      iconData = Icons.check; // Puedes usar otro icono si quieres
    } else {
      iconData = Icons.remove; // Para estado mixed
    }

    final iconColor = widget.onChanged != null
        ? theme.colors.onPrimary
        : theme.colors.disabledContent;

    return Icon(iconData, color: iconColor, size: 18);
  }
}
