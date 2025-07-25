import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class AoUiNavigationRow extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget? accessoryView;
  final double? height;

  const AoUiNavigationRow({
    super.key,
    required this.title,
    this.icon,
    this.accessoryView,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxHeight = height ?? constraints.maxHeight;
        return Row(children: [_getLeftView(context, icon, title, maxHeight)]);
      },
    );
  }

  Widget _getLeftView(
    BuildContext context,
    IconData? icon,
    String title,
    double maxHeight,
  ) {
    final theme = AppTheme.of(context);

    final TextStyle titleTextStyle = theme.typography.bodyMedium.copyWith(
      color: theme.colors.onSurface,
      fontWeight: FontWeight.bold,
    );

    final List<Widget> leftViewItems = [];

    if (icon != null) {
      leftViewItems.add(
        SizedBox(width: 24, height: 24, child: Center(child: Icon(icon))),
      );

      leftViewItems.add(const SizedBox(width: 16));
    }

    final Padding titleWidget = Padding(
      padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
      child: Text(
        title,
        style: titleTextStyle,
        textAlign: TextAlign.left,
        overflow: maxHeight == double.infinity ? null : TextOverflow.ellipsis,
      ),
    );

    leftViewItems.add(Expanded(child: titleWidget));
    leftViewItems.add(const SizedBox(width: 8, height: 0));

    if (accessoryView != null) {
      leftViewItems.add(accessoryView!);
    }

    return Expanded(child: Row(children: leftViewItems));
  }
}
