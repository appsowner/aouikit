import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class AoUiToggleSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const AoUiToggleSwitch({super.key, required this.value, this.onChanged});

  @override
  State<AoUiToggleSwitch> createState() => _AoUiToggleSwitchState();
}

class _AoUiToggleSwitchState extends State<AoUiToggleSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _circleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 60),
    );

    _circleAnimation =
        AlignmentTween(
          begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
          end: widget.value ? Alignment.centerLeft : Alignment.centerRight,
        ).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.linear),
        );

    // Set initial animation position based on widget.value
    if (widget.value) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void didUpdateWidget(covariant AoUiToggleSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool get isEnabled => widget.onChanged != null;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final colors = theme.colors;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.onChanged?.call(!widget.value);
          },
          child: Container(
            width: 40.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: _circleAnimation.value == Alignment.centerLeft
                  ? (isEnabled ? colors.onPrimary : colors.disabledBackground)
                  : (isEnabled ? colors.primary : colors.disabledBackground),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                alignment: widget.value
                    ? (Directionality.of(context) == TextDirection.rtl
                          ? Alignment.centerLeft
                          : Alignment.centerRight)
                    : (Directionality.of(context) == TextDirection.rtl
                          ? Alignment.centerRight
                          : Alignment.centerLeft),
                child: _getThumb(context),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getThumb(BuildContext context) {
    final theme = AppTheme.of(context);
    final colors = theme.colors;

    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _getThumbColor(),
      ),
      child: _getThumbIcon(),
    );
  }

  Color _getThumbColor() {
    final theme = AppTheme.of(context);
    final colors = theme.colors;

    if (!isEnabled) {
      return colors.disabledContent;
    }
    return widget.value ? colors.onPrimary : colors.outline;
  }

  Widget _getThumbIcon() {
    final theme = AppTheme.of(context);
    final colors = theme.colors;

    if (widget.value) {
      return Icon(
        Icons.check,
        size: 16,
        color: isEnabled ? colors.primary : colors.onPrimary,
      );
    } else {
      return Icon(
        Icons.close, // Reemplazo de FluentIcons.dismiss_12_regular
        size: 16,
        color: colors.onPrimary,
      );
    }
  }
}
