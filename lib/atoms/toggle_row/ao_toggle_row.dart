import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../theme/app_theme_data.dart';
import '../toggle_switch/ao_toggle_switch.dart';

class AoUiToggleRow extends StatelessWidget {
  final String title;
  final String description;
  final Icon? icon;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool backgroundDark;

  const AoUiToggleRow({
    super.key,
    required this.title,
    this.description = "",
    this.icon,
    required this.value,
    this.onChanged,
    this.backgroundDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundDark ? theme.colors.onPrimary : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Row(
        crossAxisAlignment: description.isNotEmpty
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          _getIcon(theme),
          _getTitleDescription(theme),
          _getSpacer(),
          AoUiToggleSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _getSpacer() {
    if (icon == null && description.isEmpty) {
      return const Spacer();
    }
    return const SizedBox(width: 0);
  }

  Widget _getTitleDescription(AppThemeData theme) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: theme.typography.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          _getDescription(theme),
        ],
      ),
    );
  }

  Widget _getDescription(AppThemeData theme) {
    if (description.isNotEmpty) {
      return Text(description, style: theme.typography.bodyMedium);
    }
    return const SizedBox.shrink();
  }

  Widget _getIcon(AppThemeData theme) {
    if (icon != null) {
      return Padding(padding: const EdgeInsets.only(right: 16.0), child: icon);
    }
    // Ejemplo de uso de un icono del tema si quieres un icono por defecto:
    // return Padding(
    //   padding: const EdgeInsets.only(right: 16.0),
    //   child: Icon(theme.icons.chevronRight, color: theme.colors.onSurface),
    // );
    return const SizedBox.shrink();
  }
}
