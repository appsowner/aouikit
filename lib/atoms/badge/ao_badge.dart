import 'package:flutter/material.dart';

import '../../aouikit.dart';

enum AOUIBadgeSize {
  s,
  m,
  l;

  double get size {
    switch (this) {
      case AOUIBadgeSize.s:
        return 12;
      case AOUIBadgeSize.m:
        return 16;
      case AOUIBadgeSize.l:
        return 24;
    }
  }

  Radius get borderRadius {
    switch (this) {
      case AOUIBadgeSize.s:
        return const Radius.circular(6);
      case AOUIBadgeSize.m:
        return const Radius.circular(8);
      case AOUIBadgeSize.l:
        return const Radius.circular(12);
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case AOUIBadgeSize.s:
        return const EdgeInsets.all(0);
      case AOUIBadgeSize.m:
        return const EdgeInsets.symmetric(horizontal: 4);
      case AOUIBadgeSize.l:
        return const EdgeInsets.symmetric(horizontal: 8);
    }
  }

  TextStyle getTextStyle(AppThemeData theme) {
    final colors = theme.colors;
    final typography = theme.typography;
    switch (this) {
      case AOUIBadgeSize.s:
        return typography.bodySmall.copyWith(color: colors.onError);
      case AOUIBadgeSize.m:
        return typography.bodyMedium.copyWith(color: colors.onError);
      case AOUIBadgeSize.l:
        return typography.bodyLarge.copyWith(color: colors.onError);
    }
  }
}

class AOUIBadge extends StatelessWidget {
  final AOUIBadgeSize badgeSize;
  final String? content;
  final Color? badgeColor;

  const AOUIBadge({
    super.key,
    required this.badgeSize,
    this.content,
    this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    if (content != null && badgeSize != AOUIBadgeSize.s) {
      return Container(
        height: badgeSize.size,
        alignment: Alignment.center,
        constraints: BoxConstraints(
          minHeight: badgeSize.size,
          minWidth: badgeSize.size,
        ),
        decoration: BoxDecoration(
          color: badgeColor ?? theme.colors.error,
          borderRadius: BorderRadius.all(badgeSize.borderRadius),
        ),
        padding: badgeSize.padding,
        child: Text(content!, style: badgeSize.getTextStyle(theme)),
      );
    } else {
      return Container(
        height: badgeSize.size,
        width: badgeSize.size,
        padding: badgeSize.padding,
        decoration: BoxDecoration(
          color: badgeColor ?? theme.colors.error,
          borderRadius: BorderRadius.all(badgeSize.borderRadius),
        ),
      );
    }
  }
}
