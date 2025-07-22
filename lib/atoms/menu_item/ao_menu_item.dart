// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../theme/app_theme_data.dart';

class AoUiMenuItemProperties {
  final String title;
  final AoUiMenuItemStyle style;
  final AoUiMenuItemState state;

  AoUiMenuItemProperties({
    required this.title,
    required this.style,
    this.state = AoUiMenuItemState.unchecked,
  });
}

/// AoUiMenuItem representa un ítem de menú con título e íconos.
///
/// Ejemplo:
/// ```dart
/// AoUiMenuItem(
///   item: AoUiMenuItemProperties(
///     title: 'Item 1',
///     style: AoUiMenuItemStyle.both,
///   ),
///   action: (state) {
///     print(state);
///   },
/// )
/// ```
class AoUiMenuItem extends StatefulWidget {
  final AoUiMenuItemProperties item;
  final bool backgroundDark; // para hover
  final Function(AoUiMenuItemState)? action;
  final Function(AoUiMenuItemState)? onLeftTap;
  final Function(AoUiMenuItemState)? onRightTap;

  const AoUiMenuItem({
    super.key,
    required this.item,
    this.backgroundDark = false,
    this.onLeftTap,
    this.onRightTap,
    this.action,
  });

  @override
  State<AoUiMenuItem> createState() => _AoUiMenuItemState();
}

class _AoUiMenuItemState extends State<AoUiMenuItem> {
  late AoUiMenuItemState state;

  @override
  void initState() {
    super.initState();
    state = widget.item.state;
    _setState(AoUiMenuItemTapped.none);
  }

  void _setState(AoUiMenuItemTapped tapped) {
    if (widget.item.style == AoUiMenuItemStyle.both) {
      setState(() {
        if (state == AoUiMenuItemState.unchecked) {
          if (tapped == AoUiMenuItemTapped.left) {
            state = AoUiMenuItemState.leftChecked;
          } else if (tapped == AoUiMenuItemTapped.right) {
            state = AoUiMenuItemState.rightChecked;
          }
        } else if (state == AoUiMenuItemState.leftChecked) {
          if (tapped == AoUiMenuItemTapped.left) {
            state = AoUiMenuItemState.unchecked;
          } else if (tapped == AoUiMenuItemTapped.right) {
            state = AoUiMenuItemState.bothChecked;
          }
        } else if (state == AoUiMenuItemState.rightChecked) {
          if (tapped == AoUiMenuItemTapped.right) {
            state = AoUiMenuItemState.unchecked;
          } else if (tapped == AoUiMenuItemTapped.left) {
            state = AoUiMenuItemState.bothChecked;
          }
        } else if (state == AoUiMenuItemState.bothChecked) {
          if (tapped == AoUiMenuItemTapped.left) {
            state = AoUiMenuItemState.rightChecked;
          } else if (tapped == AoUiMenuItemTapped.right) {
            state = AoUiMenuItemState.leftChecked;
          }
        }
      });
    }

    if (tapped == AoUiMenuItemTapped.left &&
        widget.item.style == AoUiMenuItemStyle.onlyLeft) {
      setState(() {
        if (state == AoUiMenuItemState.leftChecked) {
          state = AoUiMenuItemState.unchecked;
        } else {
          state = AoUiMenuItemState.leftChecked;
        }
      });
    }

    if (tapped == AoUiMenuItemTapped.right &&
        widget.item.style == AoUiMenuItemStyle.onlyRight) {
      setState(() {
        if (state == AoUiMenuItemState.rightChecked) {
          state = AoUiMenuItemState.unchecked;
        } else {
          state = AoUiMenuItemState.rightChecked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    Color color = Colors.transparent;

    if (widget.backgroundDark) {
      color = (state == AoUiMenuItemState.unchecked)
          ? theme.colors.inverseSurface
          : theme.colors.success.withOpacity(0.3);
    } else {
      color = (state == AoUiMenuItemState.unchecked)
          ? Colors.transparent
          : theme.colors.success.withOpacity(0.1);
    }

    return Material(
      color: Colors.transparent,
      child: Ink(
        child: InkWell(
          onTap: () {
            _setBgOnAction();
            widget.action?.call(state);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            decoration: BoxDecoration(color: color),
            child: Row(
              mainAxisAlignment: _getMainAxisAlignment(),
              children: [
                _getLeftIcon(theme),
                Expanded(
                  child: Container(
                    padding: _getTextPadding(),
                    child: Text(
                      widget.item.title,
                      style: theme.typography.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                _getRightIcon(theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _setBgOnAction() {
    setState(() {
      if (widget.item.style == AoUiMenuItemStyle.onlyLeft) {
        state = (state == AoUiMenuItemState.leftChecked)
            ? AoUiMenuItemState.unchecked
            : AoUiMenuItemState.leftChecked;
      } else if (widget.item.style == AoUiMenuItemStyle.onlyRight) {
        state = (state == AoUiMenuItemState.rightChecked)
            ? AoUiMenuItemState.unchecked
            : AoUiMenuItemState.rightChecked;
      } else {
        state = (state == AoUiMenuItemState.unchecked)
            ? AoUiMenuItemState.bothChecked
            : AoUiMenuItemState.unchecked;
      }
    });
  }

  EdgeInsets _getTextPadding() {
    if (widget.item.style == AoUiMenuItemStyle.onlyRight) {
      return const EdgeInsets.only(left: 24.0);
    }
    return EdgeInsets.zero;
  }

  MainAxisAlignment _getMainAxisAlignment() {
    switch (widget.item.style) {
      case AoUiMenuItemStyle.none:
        return MainAxisAlignment.center;
      case AoUiMenuItemStyle.both:
      case AoUiMenuItemStyle.onlyLeft:
      case AoUiMenuItemStyle.onlyRight:
        return MainAxisAlignment.start;
    }
  }

  List<Icon> _getIcon(AppThemeData theme) {
    final onSurface = theme.colors.onSurface;
    final success = theme.colors.success;

    switch (state) {
      case AoUiMenuItemState.unchecked:
        return [
          Icon(Icons.circle_outlined, color: onSurface),
          Icon(Icons.circle_outlined, color: onSurface),
        ];
      case AoUiMenuItemState.leftChecked:
        return [
          Icon(Icons.check_circle, color: success),
          Icon(Icons.circle_outlined, color: onSurface),
        ];
      case AoUiMenuItemState.rightChecked:
        return [
          Icon(Icons.circle_outlined, color: onSurface),
          Icon(Icons.check_circle, color: success),
        ];
      case AoUiMenuItemState.bothChecked:
        return [
          Icon(Icons.check_circle, color: success),
          Icon(Icons.check_circle, color: success),
        ];
    }
  }

  Widget _getLeftIcon(AppThemeData theme) {
    if (widget.item.style == AoUiMenuItemStyle.onlyLeft ||
        widget.item.style == AoUiMenuItemStyle.both) {
      return GestureDetector(
        onTap: () {
          _setState(AoUiMenuItemTapped.left);
          widget.onLeftTap?.call(state);
        },
        child: Container(
          padding: const EdgeInsets.only(right: 16.0),
          child: _getIcon(theme)[0],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _getRightIcon(AppThemeData theme) {
    if (widget.item.style == AoUiMenuItemStyle.onlyRight ||
        widget.item.style == AoUiMenuItemStyle.both) {
      return GestureDetector(
        onTap: () {
          _setState(AoUiMenuItemTapped.right);
          widget.onRightTap?.call(state);
        },
        child: Container(padding: EdgeInsets.zero, child: _getIcon(theme)[1]),
      );
    }
    return const SizedBox.shrink();
  }
}

enum AoUiMenuItemStyle {
  none(0),
  onlyLeft(1),
  onlyRight(2),
  both(3);

  final int value;
  const AoUiMenuItemStyle(this.value);

  static AoUiMenuItemStyle getByValue(int i) =>
      AoUiMenuItemStyle.values.firstWhere((x) => x.value == i);
}

enum AoUiMenuItemState {
  unchecked(0),
  leftChecked(1),
  rightChecked(2),
  bothChecked(3);

  final int value;
  const AoUiMenuItemState(this.value);

  static AoUiMenuItemState getByValue(int i) =>
      AoUiMenuItemState.values.firstWhere((x) => x.value == i);
}

enum AoUiMenuItemTapped {
  left(0),
  right(1),
  none(3);

  final int value;
  const AoUiMenuItemTapped(this.value);

  static AoUiMenuItemTapped getByValue(int i) =>
      AoUiMenuItemTapped.values.firstWhere((x) => x.value == i);
}
