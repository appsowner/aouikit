import 'package:flutter/material.dart';
import 'package:aouikit/atoms/radio_button/ao_radio_button.dart';

import '../../theme/app_theme.dart';

class AoUiRadioRow extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<bool>? onPressed;
  final bool isSelected;
  final bool backgroundDark;

  const AoUiRadioRow({
    super.key,
    required this.title,
    this.description = "",
    this.onPressed,
    this.isSelected = false,
    this.backgroundDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final showDescription = description.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundDark ? theme.colors.onPrimary : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: _getRowCrossAxisAlignment(),
        children: [
          AoUiRadioButton(onPressed: onPressed, isSelected: isSelected),
          const SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.typography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (showDescription)
                Text(description, style: theme.typography.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }

  CrossAxisAlignment _getRowCrossAxisAlignment() {
    return description.isNotEmpty
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;
  }
}
