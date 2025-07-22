import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// AoUiEmailSubjectField es un campo de texto para ingresar el asunto de un email.
///
/// Ejemplo:
/// ```dart
/// AoUiEmailSubjectField(
///   onTextChanged: (text) {
///     print(text);
///   },
/// )
/// ```
class AoUiEmailSubjectField extends StatefulWidget {
  final Function(String) onTextChanged;

  const AoUiEmailSubjectField({super.key, required this.onTextChanged});

  @override
  State<AoUiEmailSubjectField> createState() => _AoUiEmailSubjectFieldState();
}

class _AoUiEmailSubjectFieldState extends State<AoUiEmailSubjectField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isEditing = false;
  String enteredText = "";

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isEditing = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    TextStyle labelTextStyle = theme.typography.bodySmall.copyWith(
      color: theme.colors.outlineVariant,
    );

    TextStyle textStyle = theme.typography.bodySmall.copyWith(
      fontWeight: FontWeight.w600, // SemiBold
    );

    return TextField(
      controller: _controller,
      style: textStyle,
      onChanged: (text) {
        setState(() {
          enteredText = text;
          widget.onTextChanged(text);
        });
      },
      focusNode: _focusNode,
      decoration: InputDecoration(
        labelText: (_isEditing || enteredText.isNotEmpty) ? '' : 'Subject',
        labelStyle: labelTextStyle,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: theme.colors.outlineVariant,
            width: 0.5,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: theme.colors.outlineVariant,
            width: 0.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: theme.colors.primary, width: 1.0),
        ),
      ),
    );
  }
}
