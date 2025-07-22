import 'package:flutter/material.dart';

import '../../aouikit.dart';

/// Widget para mostrar un archivo adjunto con título, descripción y botones de acción.
class AOUIAttachmentUpload extends StatelessWidget {
  final String title;
  final bool isIconUsed;
  final IconData? icon;
  final Widget? image; // Cambié TUIImage por Widget para flexibilidad
  final String description;
  final VoidCallback? deleteTapped;
  final VoidCallback? downloadTapped;

  const AOUIAttachmentUpload({
    super.key,
    required this.title,
    required this.isIconUsed,
    this.icon,
    this.image,
    this.description = "",
    this.deleteTapped,
    this.downloadTapped,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageIcon(theme),
        _buildTitleAndDescription(theme),
        _buildTrailingButtons(theme),
      ],
    );
  }

  Widget _buildImageIcon(AppThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80,
        height: 60,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: theme.colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: _getImageOrIcon(),
      ),
    );
  }

  Widget _getImageOrIcon() {
    if (isIconUsed) {
      return icon != null
          ? Center(child: Icon(icon, size: 32))
          : const SizedBox.shrink();
    } else {
      return image ?? const SizedBox.shrink();
    }
  }

  Widget _buildTitleAndDescription(AppThemeData theme) {
    final titleStyle = theme.typography.bodyLarge.copyWith(
      color: theme.colors.onSurface,
    );
    final descriptionStyle = theme.typography.bodySmall.copyWith(
      color: theme.colors.outlineVariant,
    );

    List<Widget> columnChildren = [
      Text(title, overflow: TextOverflow.ellipsis, style: titleStyle),
    ];

    if (description.isNotEmpty) {
      columnChildren.add(
        Text(
          description,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
        ),
      );
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: columnChildren,
          ),
        ),
      ),
    );
  }

  Widget _buildTrailingButtons(AppThemeData theme) {
    List<Widget> buttons = [];

    if (downloadTapped != null) {
      buttons.add(
        GestureDetector(
          onTap: downloadTapped,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.download, // Cambié icono Fluent por Material
              color: theme.colors.disabledContent,
            ),
          ),
        ),
      );
    }

    if (deleteTapped != null) {
      buttons.add(
        GestureDetector(
          onTap: deleteTapped,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.delete_outline, // Cambié icono Fluent por Material
              color: theme.colors.disabledContent,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(height: 60, child: Row(children: buttons)),
    );
  }
}
