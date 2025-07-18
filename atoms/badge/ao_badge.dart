import 'package:flutter/material.dart';

import '../../aouikit.dart';

enum AoBadgeSize {
  s,
  m,
  l;

  double get size {
    switch (this) {
      case AoBadgeSize.s:
        return 12;
      case AoBadgeSize.m:
        return 16;
      case AoBadgeSize.l:
        return 24;
    }
  }

  Radius get borderRadius {
    switch (this) {
      case AoBadgeSize.s:
        return const Radius.circular(6);
      case AoBadgeSize.m:
        return const Radius.circular(8);
      case AoBadgeSize.l:
        return const Radius.circular(12);
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case AoBadgeSize.s:
        return const EdgeInsets.all(0);
      case AoBadgeSize.m:
        return const EdgeInsets.symmetric(horizontal: 4);
      case AoBadgeSize.l:
        return const EdgeInsets.symmetric(horizontal: 8);
    }
  }

  TextStyle getTextStyle(AppThemeData theme) {
    final colors = theme.colors;
    final typography = theme.typography;
    switch (this) {
      case AoBadgeSize.s:
        return typography.bodySmall.copyWith(color: colors.onError);
      case AoBadgeSize.m:
        return typography.bodyMedium.copyWith(color: colors.onError);
      case AoBadgeSize.l:
        return typography.bodyLarge.copyWith(color: colors.onError);
    }
  }
}

class AoBadge extends StatelessWidget {
  final AoBadgeSize badgeSize;
  final String? content;
  final Color? badgeColor;

  const AoBadge({
    Key? key,
    required this.badgeSize,
    this.content,
    this.badgeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    if (content != null && badgeSize != AoBadgeSize.s) {
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
