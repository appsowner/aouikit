import 'package:flutter/material.dart';

import '../../aouikit.dart';

class AoAvatar extends StatelessWidget {
  final AoAvatarSize avatarSize;
  final AoAvatarContent avatarContent;
  final Color? textColor;
  final Color? backgroundColor;
  final bool isBadged;

  const AoAvatar({
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
        child: AoBadge(
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
    return avatarSize.badgeSize == AoBadgeSize.l ? -8 : -4;
  }
}

class AoAvatarContent {
  final AoAvatarContentType type;
  final IconData? icon;
  final Widget? image;
  final String? text;

  AoAvatarContent({required this.type, this.icon, this.image, this.text});
}

enum AoAvatarContentType { image, icon, text }

enum AoAvatarSize {
  xxs(size: 24, badgeSize: AoBadgeSize.s),
  xs(size: 32, badgeSize: AoBadgeSize.s),
  s(size: 40, badgeSize: AoBadgeSize.s),
  m(size: 48, badgeSize: AoBadgeSize.s),
  l(size: 64, badgeSize: AoBadgeSize.m),
  xl(size: 80, badgeSize: AoBadgeSize.l),
  xxl(size: 96, badgeSize: AoBadgeSize.l);

  const AoAvatarSize({required this.size, required this.badgeSize});

  final double size;
  final AoBadgeSize badgeSize;

  TextStyle getTextStyle(AppThemeData theme) {
    switch (this) {
      case AoAvatarSize.xxs:
        return theme.typography.bodySmall.copyWith(fontWeight: FontWeight.w600);
      case AoAvatarSize.xs:
        return theme.typography.bodyMedium.copyWith(
          fontWeight: FontWeight.w700,
        );
      case AoAvatarSize.s:
        return theme.typography.bodyLarge.copyWith(fontWeight: FontWeight.bold);
      case AoAvatarSize.m:
        return theme.typography.titleMedium.copyWith(
          fontWeight: FontWeight.w600,
        );
      case AoAvatarSize.l:
        return theme.typography.titleLarge.copyWith(
          fontWeight: FontWeight.w600,
        );
      case AoAvatarSize.xl:
        return theme.typography.headlineSmall.copyWith(
          fontWeight: FontWeight.w600,
        );
      case AoAvatarSize.xxl:
        return theme.typography.headlineMedium.copyWith(
          fontWeight: FontWeight.bold,
        );
    }
  }
}
