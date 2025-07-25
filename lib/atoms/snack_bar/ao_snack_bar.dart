// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../aouikit.dart';

enum AoUiSnackBarType {
  success,
  information,
  warning,
  error;

  Color _getBackgroundColor(AoUiColors colors) {
    switch (this) {
      case AoUiSnackBarType.success:
        return colors.success;
      case AoUiSnackBarType.information:
        return colors.secondary;
      case AoUiSnackBarType.warning:
        return colors.warning;
      case AoUiSnackBarType.error:
        return colors.error;
    }
  }

  Color _getForegroundColor(AoUiColors colors) {
    switch (this) {
      case AoUiSnackBarType.success:
        return colors.success;
      case AoUiSnackBarType.information:
        return colors.onSecondary;
      case AoUiSnackBarType.warning:
        return colors.warning;
      case AoUiSnackBarType.error:
        return colors.onError;
    }
  }

  IconData _getIconData(AoUiIcons icons) {
    switch (this) {
      case AoUiSnackBarType.success:
        return icons.successCheckMark;
      case AoUiSnackBarType.information:
        return icons.information;
      case AoUiSnackBarType.warning:
        return icons.warning;
      case AoUiSnackBarType.error:
        return icons.error;
    }
  }
}

class AoUiSnackBarAction {
  final String label;
  final VoidCallback onActionPressed;
  final bool _isDismissed;

  AoUiSnackBarAction({required this.label, required this.onActionPressed})
    : _isDismissed = false;

  AoUiSnackBarAction.dismiss(this.label)
    : onActionPressed = (() {}),
      _isDismissed = true;
}

class AoUiSnackBar extends SnackBar {
  AoUiSnackBar({
    super.key,
    required BuildContext context,
    AoUiSnackBarType type = AoUiSnackBarType.information,
    required String message,
    AoUiSnackBarAction? action,
    Duration? duration,
    super.onVisible,
  }) : super(
         elevation: 0,
         duration: duration ?? const Duration(seconds: 4),
         backgroundColor: type._getBackgroundColor(AppTheme.of(context).colors),
         behavior: SnackBarBehavior.floating,
         content: _buildContent(context, type, message, action),
         shape: const StadiumBorder(),
       );

  static Widget _buildContent(
    BuildContext context,
    AoUiSnackBarType type,
    String message,
    AoUiSnackBarAction? action,
  ) {
    final theme = AppTheme.of(context);
    final colors = theme.colors;
    final typography = theme.typography;
    final icons = theme.icons;

    return Row(
      children: [
        Icon(type._getIconData(icons), color: type._getForegroundColor(colors)),
        SizedBox(width: theme.spacing.s),
        Expanded(
          child: Text(
            message,
            style: typography.bodyMedium.copyWith(
              color: type._getForegroundColor(colors),
            ),
          ),
        ),
        if (action != null) ...[
          SizedBox(width: theme.spacing.s),
          TextButton(
            onPressed: action._isDismissed
                ? () {
                    ScaffoldMessenger.of(
                      context,
                    ).hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
                  }
                : action.onActionPressed,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                type._getBackgroundColor(colors),
              ),
              backgroundColor: MaterialStateProperty.all(
                type._getForegroundColor(colors),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 18),
              ),
              shape: MaterialStateProperty.all(const StadiumBorder()),
            ),
            child: Text(
              action.label,
              textAlign: TextAlign.center,
              style: typography.bodySmall.copyWith(
                color: type._getBackgroundColor(colors),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
