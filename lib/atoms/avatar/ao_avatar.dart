import 'package:flutter/material.dart';

import '../../aouikit.dart';

class AOUIAoAvatar extends StatelessWidget {
  final AOUIAoAvatarSize avatarSize;
  final AOUIAoAvatarContent avatarContent;
  final Color? textColor;
  final Color? backgroundColor;
  final bool isBadged;

  const AOUIAoAvatar({
    super.key,
    required this.avatarSize,
    required this.avatarContent,
    this.textColor,
    this.backgroundColor,
    this.isBadged = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final colors = theme.colors;
    final effectiveTextColor = textColor ?? colors.onTertiary;
    final effectiveBackgroundColor = backgroundColor ?? colors.tertiary;

    Widget circleChild;
    if (avatarContent.icon != null) {
      circleChild = Icon(
        avatarContent.icon,
        size: avatarSize.size / 2,
        color: colors.onTertiary, // Ajusta si no tienes este color
      );
    } else if (avatarContent.text != null) {
      final textStyle = avatarSize
          .getTextStyle(theme)
          .copyWith(color: effectiveTextColor);
      circleChild = Text(avatarContent.text!, style: textStyle);
    } else if (avatarContent.image != null) {
      circleChild = ClipOval(child: avatarContent.image!);
    } else {
      circleChild = const SizedBox.shrink();
    }

    Widget avatar = ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        alignment: Alignment.center,
        width: avatarSize.size,
        height: avatarSize.size,
        color: effectiveBackgroundColor,
        child: circleChild,
      ),
    );

    if (isBadged) {
      final badge = Positioned(
        right: _getBadgePadding(),
        bottom: _getBadgePadding(),
        child: AOUIBadge(
          badgeSize: avatarSize.badgeSize,
          badgeColor: colors.success,
        ),
      );
      return Center(
        child: SizedBox(
          width: avatarSize.size,
          height: avatarSize.size,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [avatar, badge],
          ),
        ),
      );
    } else {
      return Center(
        child: SizedBox(
          width: avatarSize.size,
          height: avatarSize.size,
          child: avatar,
        ),
      );
    }
  }

  double _getBadgePadding() {
    return avatarSize.badgeSize == AOUIBadgeSize.l ? -8 : -4;
  }
}

class AOUIAoAvatarContent {
  final AOUIAoAvatarContentType type;
  final IconData? icon;
  final Widget? image;
  final String? text;

  AOUIAoAvatarContent({required this.type, this.icon, this.image, this.text});
}

enum AOUIAoAvatarContentType { image, icon, text }

enum AOUIAoAvatarSize {
  xxs(size: 24, badgeSize: AOUIBadgeSize.s),
  xs(size: 32, badgeSize: AOUIBadgeSize.s),
  s(size: 40, badgeSize: AOUIBadgeSize.s),
  m(size: 48, badgeSize: AOUIBadgeSize.s),
  l(size: 64, badgeSize: AOUIBadgeSize.m),
  xl(size: 80, badgeSize: AOUIBadgeSize.l),
  xxl(size: 96, badgeSize: AOUIBadgeSize.l);

  const AOUIAoAvatarSize({required this.size, required this.badgeSize});

  final double size;
  final AOUIBadgeSize badgeSize;

  TextStyle getTextStyle(AppThemeData theme) {
    switch (this) {
      case AOUIAoAvatarSize.xxs:
        return theme.typography.bodySmall.copyWith(fontWeight: FontWeight.w600);
      case AOUIAoAvatarSize.xs:
        return theme.typography.bodyMedium.copyWith(
          fontWeight: FontWeight.w700,
        );
      case AOUIAoAvatarSize.s:
        return theme.typography.bodyLarge.copyWith(fontWeight: FontWeight.bold);
      case AOUIAoAvatarSize.m:
        return theme.typography.titleMedium.copyWith(
          fontWeight: FontWeight.w600,
        );
      case AOUIAoAvatarSize.l:
        return theme.typography.titleLarge.copyWith(
          fontWeight: FontWeight.w600,
        );
      case AOUIAoAvatarSize.xl:
        return theme.typography.headlineSmall.copyWith(
          fontWeight: FontWeight.w600,
        );
      case AOUIAoAvatarSize.xxl:
        return theme.typography.headlineMedium.copyWith(
          fontWeight: FontWeight.bold,
        );
    }
  }
}
