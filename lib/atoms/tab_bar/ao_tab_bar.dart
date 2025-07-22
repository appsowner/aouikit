import 'package:flutter/material.dart';

import '../../aouikit.dart';

enum AoUiTabBarSize { regular, large }

class AoUiTabBar extends StatelessWidget {
  final List<String> titles;
  final int selectedIndex;
  final AoUiTabBarSize size;
  final ValueChanged<int>? onPressed;

  const AoUiTabBar({
    super.key,
    required this.titles,
    required this.selectedIndex,
    required this.size,
    this.onPressed,
  });

  Widget _buildItem(int index, String item) {
    return Padding(
      padding: EdgeInsets.fromLTRB(index == 0 ? 4 : 2, 4, 2, 4),
      child: AoUiButton(
        label: item,
        type: selectedIndex == index
            ? AOUIButtonType.secondary
            : AOUIButtonType.ghost,
        size: size == AoUiTabBarSize.regular
            ? AOUIButtonSize.l
            : AOUIButtonSize.m,
        onPressed: () {
          onPressed?.call(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final colors = theme.colors;

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        decoration: ShapeDecoration(
          color: colors.onPrimary,
          shape: const StadiumBorder(),
        ),
        height: size == AoUiTabBarSize.regular ? 40 : 48,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: List.generate(titles.length, (index) {
            final item = titles[index];
            return _buildItem(index, item);
          }),
        ),
      ),
    );
  }
}
