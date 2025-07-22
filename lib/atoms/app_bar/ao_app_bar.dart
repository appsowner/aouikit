import 'package:flutter/material.dart';

import '../../aouikit.dart';

class AOUIAppTopBar extends StatefulWidget {
  final List<AoAppBarItem> items;
  final ValueChanged<int>? onTap;
  final int currentIndex;

  AOUIAppTopBar({
    super.key,
    required this.items,
    this.onTap,
    this.currentIndex = 0,
  }) : assert(
         (items.every((element) => element.label?.isNotEmpty == true) ||
             items.every(
               (element) =>
                   element.label == null || element.label!.trim().isEmpty,
             )),
         "Either all items should have label or none.",
       );

  @override
  State<AOUIAppTopBar> createState() => _AOUIAppTopBarState();
}

class _AOUIAppTopBarState extends State<AOUIAppTopBar> {
  late final List<BottomNavigationBarItem> _bnbItems;
  late final bool _showLabels;

  @override
  void initState() {
    super.initState();
    _bnbItems = widget.items
        .map(
          (item) => BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(item.iconData),
            ),
            label: item.label ?? '',
            tooltip: item.tooltip,
          ),
        )
        .toList(growable: false);

    _showLabels = widget.items.any(
      (element) => element.label != null && element.label!.trim().isNotEmpty,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: theme.colors.surfaceContainerLow, // Ajusta según tu paleta
          height: 1,
        ),
        BottomNavigationBar(
          items: _bnbItems,
          onTap: widget.onTap,
          iconSize: 24,
          currentIndex: widget.currentIndex,
          showSelectedLabels: _showLabels,
          showUnselectedLabels: _showLabels,
          backgroundColor: theme.colors.surface,
          selectedItemColor: theme.colors.primary,
          unselectedItemColor: theme.colors.outlineVariant,
          type: _showLabels
              ? BottomNavigationBarType.fixed
              : BottomNavigationBarType.shifting,
        ),
      ],
    );
  }
}

class AoAppBarItem {
  final IconData iconData;
  final String? label;
  final String? tooltip;

  AoAppBarItem({required this.iconData, this.label, this.tooltip});
}
