import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AoUiMobileOverlayFooter extends StatelessWidget {
  final List<AoUiOverlayFooterAction> actions;

  const AoUiMobileOverlayFooter({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final colors = theme.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 0, thickness: 1),
        Container(
          color: colors.surface,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: actions
                .map(
                  (action) => IconButton(
                    icon: Icon(action.icon),
                    onPressed: action.handler,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class AoUiOverlayFooterAction {
  final IconData icon;
  final VoidCallback handler;

  AoUiOverlayFooterAction({required this.icon, required this.handler});
}
