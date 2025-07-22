import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../theme/app_theme_data.dart';

/// AoUiEmailField es un widget para ingresar direcciones de email.
///
/// Ejemplo:
/// ```dart
/// AoUiEmailField(
///   label: AoUiEmailFieldLabel.to,
///   emails: ['abc@gmail.com'],
///   showSuffix: true,
///   onAdd: () {
///     print('Botón agregar pulsado');
///   },
///   onRemove: () {
///     print('Botón eliminar pulsado');
///   },
///   controller: TextEditingController(),
/// )
/// ```
class AoUiEmailField extends StatefulWidget {
  final AoUiEmailFieldLabel label;
  final List<String> emails;
  final bool showSuffix;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  final TextEditingController? controller;

  const AoUiEmailField({
    super.key,
    this.label = AoUiEmailFieldLabel.to,
    required this.emails,
    this.showSuffix = false,
    this.onAdd,
    this.onRemove,
    this.controller,
  });

  @override
  State<StatefulWidget> createState() => _AoUiEmailFieldState();
}

class _AoUiEmailFieldState extends State<AoUiEmailField> {
  late List<String> _emails = [];
  late TextEditingController _emailController;
  final FocusNode _focusNode = FocusNode();
  BorderSide borderSide = const BorderSide(
    width: 2.0,
    color: Colors.transparent,
  );

  @override
  void initState() {
    super.initState();
    _emailController = widget.controller ?? TextEditingController();
    _emails = List.from(widget.emails);
    _focusNode.addListener(onFocusChange);
    _emailController.addListener(onTextChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final theme = AppTheme.of(context);
    setState(() {
      borderSide = BorderSide(
        width: 1.0,
        color: theme.colors.surfaceContainerLow,
      );
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(onFocusChange);
    _focusNode.dispose();
    if (widget.controller == null) {
      _emailController.dispose();
    }
    super.dispose();
  }

  void onTextChanged() {
    String text = _emailController.text;
    if (text.contains(" ")) {
      _emails.add(text.split(" ")[0]);
      _emailController.clear();
      setState(() {});
    }
  }

  void onSubmitted(String text) {
    String email = text.trim();
    if (email.isNotEmpty) {
      _emails.add(email);
      _emailController.clear();
      setState(() {});
    }
  }

  void onFocusChange() {
    final theme = AppTheme.of(context);
    setState(() {
      borderSide = BorderSide(
        width: _focusNode.hasFocus ? 2.0 : 1.0,
        color: _focusNode.hasFocus
            ? theme.colors.primary
            : theme.colors.surfaceContainerLow,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Container(
      decoration: BoxDecoration(border: Border(bottom: borderSide)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: _emails.isEmpty
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: _getPrefix(context),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 4.0,
                  runAlignment: WrapAlignment.start,
                  children: _emails.asMap().entries.map((entry) {
                    int idx = entry.key;
                    String email = entry.value;
                    return _getChip(email, theme, idx);
                  }).toList(),
                ),
                TextField(
                  focusNode: _focusNode,
                  cursorHeight: 16.0,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _getTextFieldDecoration(),
                  onSubmitted: onSubmitted,
                ),
              ],
            ),
          ),
          if (widget.showSuffix) _getSuffix(theme),
        ],
      ),
    );
  }

  Chip _getChip(String email, AppThemeData theme, int idx) {
    return Chip(
      label: Text(email),
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
      labelStyle: theme.typography.bodySmall,
      labelPadding: EdgeInsets.zero,
      backgroundColor: theme.colors.surfaceContainerLow,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      side: BorderSide(color: theme.colors.surfaceContainerLow),
      onDeleted: () {
        widget.onRemove?.call();
        _emails.removeAt(idx);
        setState(() {});
      },
      deleteIcon: Icon(Icons.close, color: theme.colors.onSurface, size: 20.0),
    );
  }

  InputDecoration _getTextFieldDecoration() {
    return const InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.zero,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    );
  }

  Widget _getSuffix(AppThemeData theme) {
    return GestureDetector(
      onTap: () {
        widget.onAdd?.call();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 8.0),
        child: AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 600),
          child: Icon(Icons.add_circle_outline, color: theme.colors.primary),
        ),
      ),
    );
  }

  Widget _getPrefix(BuildContext context) {
    final theme = AppTheme.of(context);
    String labelText;
    switch (widget.label) {
      case AoUiEmailFieldLabel.to:
        labelText = "To";
        break;
      case AoUiEmailFieldLabel.cc:
        labelText = "CC";
        break;
      case AoUiEmailFieldLabel.bcc:
        labelText = "BCC";
        break;
    }
    bool isEmailNotEmpty = widget.emails.isNotEmpty;

    return Column(
      mainAxisAlignment: isEmailNotEmpty
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Text(labelText, style: theme.typography.bodySmall)],
    );
  }
}

enum AoUiEmailFieldLabel { to, cc, bcc }
