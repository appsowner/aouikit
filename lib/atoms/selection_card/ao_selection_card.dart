import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../theme/app_theme_data.dart';

class AoUiSelectionCardStyle {
  final String title;
  final List<String>? description;
  final String footer;

  AoUiSelectionCardStyle({
    required this.title,
    this.description,
    this.footer = "",
  });
}

class AoUiSelectionCard extends StatelessWidget {
  final bool isSelected;
  final bool showChevron;
  final AoUiSelectionCardStyle style;
  final IconData? icon;
  final int? badgeCount;
  final Color? badgeColor;
  final bool isHovered;
  final VoidCallback? action;

  const AoUiSelectionCard({
    super.key,
    required this.style,
    this.isSelected = false,
    this.showChevron = false,
    this.icon,
    this.badgeCount,
    this.badgeColor,
    this.isHovered = false,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return GestureDetector(
      onTap: action,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: _getBackgroundColor(theme),
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_getLeftSide(theme), _getRightSide(theme)],
        ),
      ),
    );
  }

  Color _getBackgroundColor(AppThemeData theme) {
    if (!isSelected && !isHovered) {
      return theme.colors.surface;
    }
    if (!isSelected && isHovered) {
      return theme
          .colors
          .onPrimaryContainer; // Ajusta según tu token para hover
    }
    if (isSelected && !isHovered) {
      return theme
          .colors
          .primaryContainer; // Ajusta según tu token para primaryAlt
    }
    if (isSelected && isHovered) {
      return theme.colors.primaryContainer.withOpacity(
        0.8,
      ); // Ajusta según tu token para primaryAltHover
    }
    return theme.colors.surface;
  }

  Widget _getLeftSide(AppThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          child: _getIcon(theme),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(style.title, style: theme.typography.bodySmall),
            if (style.description != null)
              ...style.description!.map(
                (e) => Text(
                  e,
                  style: theme.typography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            _getFooter(theme),
          ],
        ),
      ],
    );
  }

  Widget _getRightSide(AppThemeData theme) {
    return Row(
      children: [
        if (badgeCount != null)
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: badgeColor ?? theme.colors.tertiary,
            ),
            alignment: Alignment.center,
            child: Text(
              badgeCount.toString(),
              style: theme.typography.labelSmall.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        if (showChevron) const Icon(Icons.chevron_right, size: 24),
      ],
    );
  }

  Widget _getIcon(AppThemeData theme) {
    return Icon(icon ?? Icons.person_outline, color: theme.colors.secondary);
  }

  Widget _getFooter(AppThemeData theme) {
    if (style.footer.isNotEmpty) {
      return Text(style.footer, style: theme.typography.bodySmall);
    }
    return const SizedBox.shrink();
  }
}
