import 'package:flutter/material.dart';
import '../../aouikit.dart';

class AoUiMobileOverlayHeader extends StatelessWidget {
  final AoUiOverlayMobileStyle style;

  const AoUiMobileOverlayHeader({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Container(
      height: style.style == AoUiOverlayMobileStyleType.handle ? 28 : 68,
      decoration: BoxDecoration(color: theme.colors.surface),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          List<Widget?> items = [];
          items.add(_getBottomDivider(context, constraints.maxWidth));
          items.add(_getTitleView(context));
          items.add(_getBackButton());
          items.add(_getRightView(context));
          items.add(_getTopDivider(context, constraints.maxWidth));

          List<Widget> children = items.whereType<Widget>().toList();

          return Stack(children: children);
        },
      ),
    );
  }

  Widget? _getTopDivider(BuildContext context, double width) {
    final theme = AppTheme.of(context);

    return Center(
      heightFactor: 1,
      child: Container(
        height: 4,
        width: 68,
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: theme.colors.disabledContent,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }

  Widget? _getTitleView(BuildContext context) {
    final theme = AppTheme.of(context);
    final textStyle = theme.typography.titleLarge;

    if (style.style == AoUiOverlayMobileStyleType.handle) {
      return null;
    }

    return Container(
      alignment: style.style == AoUiOverlayMobileStyleType.right
          ? Alignment.centerLeft
          : Alignment.center,
      margin: const EdgeInsets.all(16),
      child: Text(style.title ?? "", style: textStyle),
    );
  }

  Widget? _getRightView(BuildContext context) {
    if (style.style != AoUiOverlayMobileStyleType.right) return null;

    return Positioned(
      top: 0,
      right: 0,
      bottom: 0,
      child: AoUiIconButton(
        type: AoUiIconButtonType.ghost,
        size: AoUiIconButtonSize.m,
        iconData: style.getIcon(),
        onPressed: style.action,
      ),
    );
  }

  Widget? _getBackButton() {
    if (style.style != AoUiOverlayMobileStyleType.left) return null;

    return Positioned(
      left: 0,
      top: 0,
      bottom: 0,
      child: AoUiIconButton(
        type: AoUiIconButtonType.ghost,
        size: AoUiIconButtonSize.s,
        iconData: Icons.chevron_left,
        onPressed: style.action,
      ),
    );
  }

  Widget? _getBottomDivider(BuildContext context, double width) {
    final theme = AppTheme.of(context);

    if (style.style == AoUiOverlayMobileStyleType.handle) return null;

    return Column(
      children: [
        const Spacer(),
        Container(
          width: width,
          height: 1,
          decoration: BoxDecoration(color: theme.colors.disabledContent),
        ),
      ],
    );
  }
}

class AoUiOverlayMobileStyle {
  final AoUiOverlayMobileStyleType style;
  final String? title;
  final VoidCallback? action;
  final IconData? icon;

  AoUiOverlayMobileStyle({
    required this.style,
    this.title,
    this.action,
    this.icon,
  }) {
    if (style == AoUiOverlayMobileStyleType.handle) {
      assert(title == null && action == null && icon == null);
    } else if (style == AoUiOverlayMobileStyleType.onlyTitle) {
      assert(title != null && action == null && icon == null);
    } else if (style == AoUiOverlayMobileStyleType.left) {
      assert(title != null && action != null && icon == null);
    } else if (style == AoUiOverlayMobileStyleType.right) {
      assert(title != null && action != null && icon != null);
    }
  }

  IconData getIcon() {
    return icon ?? Icons.accessibility_new;
  }
}

enum AoUiOverlayMobileStyleType { handle, onlyTitle, left, right }
