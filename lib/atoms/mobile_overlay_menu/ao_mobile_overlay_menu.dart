import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../menu_item/ao_menu_item.dart';
import '../mobile_overlay_footer/ao_mobile_overlay_footer.dart';
import '../mobile_overlay_header/ao_mobile_overlay_header.dart';

class AoUiMobileOverlayMenu extends StatelessWidget {
  final String title;
  final VoidCallback? action;
  final double padding = 16;
  final double verticalGap = 8;
  final List<AoUiMenuItem> menuItems;
  final bool isScrollable;

  const AoUiMobileOverlayMenu({
    super.key,
    required this.title,
    required this.action,
    required this.menuItems,
    required this.isScrollable,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final colors = theme.colors;

    if (!isScrollable) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getHeaderView(context),
          _getNonScrollingMenuItems(context),
          _getFooterView(context),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _getHeaderView(context),
          Expanded(
            child: Container(
              color: colors.surface,
              child: _getMenuItemViewAsList(context),
            ),
          ),
          _getFooterView(context),
        ],
      );
    }
  }

  Widget _getHeaderView(BuildContext context) {
    final headerStyle = title.isEmpty
        ? AoUiOverlayMobileStyleType.handle
        : AoUiOverlayMobileStyleType.onlyTitle;

    final style = AoUiOverlayMobileStyle(style: headerStyle, title: title);

    return AoUiMobileOverlayHeader(style: style);
  }

  Widget _getNonScrollingMenuItems(BuildContext context) {
    return Container(
      color: AppTheme.of(context).colors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: menuItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Padding(padding: EdgeInsets.all(padding), child: item);
        }).toList(),
      ),
    );
  }

  Widget _getMenuItemViewAsList(BuildContext context) {
    return ListView(
      children: menuItems.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return Padding(padding: EdgeInsets.all(padding), child: item);
      }).toList(),
    );
  }

  Widget _getFooterView(BuildContext context) {
    final closeButton = AoUiOverlayFooterAction(
      icon: Icons.close,
      handler: () {
        Navigator.of(context).pop();
        action?.call();
      },
    );

    return AoUiMobileOverlayFooter(actions: [closeButton]);
  }
}
