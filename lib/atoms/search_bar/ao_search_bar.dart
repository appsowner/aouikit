import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../theme/app_theme_data.dart';

class AoUiSearchBar extends StatefulWidget {
  final bool showBackIcon;
  final bool showClearButton;
  final String placeholder;
  final VoidCallback? onBackAction;
  final VoidCallback? onClear;
  final ValueChanged<String>? onChanged;
  final TextEditingController? textEditingController;
  final bool autofocus;

  const AoUiSearchBar({
    super.key,
    this.showBackIcon = true,
    this.showClearButton = false,
    this.placeholder = "Buscar",
    this.onBackAction,
    this.onClear,
    this.textEditingController,
    this.onChanged,
    this.autofocus = false,
  });

  @override
  State<AoUiSearchBar> createState() => _AoUiSearchBarState();
}

class _AoUiSearchBarState extends State<AoUiSearchBar> {
  late TextEditingController _controller;
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.textEditingController ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(4.0),
      width: MediaQuery.of(context).size.width,
      height: 48.0,
      decoration: BoxDecoration(
        color: theme.colors.onPrimary,
        borderRadius: const BorderRadius.all(Radius.circular(75.0)),
      ),
      child: Row(
        children: [
          _getPrefixIcon(theme),
          Flexible(
            child: TextField(
              maxLines: 1,
              controller: _controller,
              style: theme.typography.bodyMedium,
              onChanged: (value) {
                widget.onChanged?.call(value);
                if (widget.showClearButton) {
                  setState(() {
                    _showClearButton = value.isNotEmpty;
                  });
                }
              },
              autofocus: widget.autofocus,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                border: InputBorder.none,
                isDense: true,
                contentPadding: _getContentPadding(),
              ),
            ),
          ),
          _getSuffixIcon(theme),
        ],
      ),
    );
  }

  EdgeInsets _getContentPadding() {
    if (!widget.showBackIcon) {
      return const EdgeInsets.only(left: 24.0);
    }
    return EdgeInsets.zero;
  }

  Widget _getSuffixIcon(AppThemeData theme) {
    if (_showClearButton) {
      return GestureDetector(
        onTap: () {
          _controller.clear();
          widget.onClear?.call();
          setState(() {
            _showClearButton = false;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.clear, color: theme.colors.onSurface),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _getPrefixIcon(AppThemeData theme) {
    if (widget.showBackIcon) {
      return GestureDetector(
        onTap: widget.onBackAction,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.chevron_left, color: theme.colors.onSurface),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
