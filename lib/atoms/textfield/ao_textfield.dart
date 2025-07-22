import 'package:aouikit/aouikit.dart';
import 'package:flutter/material.dart';

/// AoUiInputField es un campo de texto configurable con soporte para prefix/suffix
class AoUiInputField extends StatelessWidget {
  final bool enabled;
  final bool readOnly;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final String? helperText;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final TextDirection? textDirection;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final AoUiTextFieldStartEndItem? prefix;
  final AoUiTextFieldStartEndItem? suffix;
  final bool obscureText;
  final String obscuringCharacter;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool canRequestFocus;
  final bool? enableInteractiveSelection;
  final MouseCursor? mouseCursor;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;

  const AoUiInputField({
    super.key,
    this.enabled = true,
    this.readOnly = false,
    this.hintText,
    this.labelText = 'Label',
    this.errorText,
    this.helperText,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.textCapitalization = TextCapitalization.none,
    this.textDirection = TextDirection.ltr,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.obscuringCharacter = '*',
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
    this.canRequestFocus = true,
    this.enableInteractiveSelection,
    this.mouseCursor,
  }) : assert(maxLines == null || maxLines > 0),
       assert(minLines == null || minLines > 0),
       assert(
         (maxLines == null) || (minLines == null) || (maxLines >= minLines),
         "minLines can't be greater than maxLines",
       ),
       assert(
         !expands || (maxLines == null && minLines == null),
         'minLines and maxLines must be null when expands is true.',
       ),
       assert(
         !obscureText || maxLines == 1,
         'Obscured fields cannot be multiline.',
       ),
       assert(
         maxLength == null ||
             maxLength == TextField.noMaxLength ||
             maxLength > 0,
       );

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final (prefixIcon, prefixIconConstraints) = _convertStartEndItemToWidget(
      prefix,
      theme,
    );
    final (suffixIcon, suffixIconConstraints) = _convertStartEndItemToWidget(
      suffix,
      theme,
    );

    return TextField(
      mouseCursor: mouseCursor,
      canRequestFocus: canRequestFocus,
      enableInteractiveSelection: enableInteractiveSelection,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      controller: controller,
      style: theme.typography.bodyLarge.copyWith(color: theme.colors.onSurface),
      onTap: onTap,
      readOnly: readOnly,
      expands: expands,
      enabled: enabled,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textCapitalization: textCapitalization,
      textDirection: textDirection,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.colors.surfaceContainerLow,
        hintText: hintText,
        hintStyle: theme.typography.bodyLarge.copyWith(
          color: theme.colors.onSurface.withOpacity(0.6),
        ),
        labelText: labelText,
        labelStyle: theme.typography.bodyLarge.copyWith(
          color: theme.colors.onSurface.withOpacity(0.6),
        ),
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints,
        errorText: errorText,
        helperText: helperText,
        errorStyle: theme.typography.bodySmall.copyWith(
          color: theme.colors.error,
        ),
        helperStyle: theme.typography.bodySmall.copyWith(
          color: theme.colors.onSurface,
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.colors.primary),
        ),
        disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.colors.surfaceContainerLow),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.colors.surfaceContainerLow),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.colors.surfaceContainerLow),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.colors.error),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.colors.error),
        ),
      ),
    );
  }

  (Widget?, BoxConstraints?) _convertStartEndItemToWidget(
    AoUiTextFieldStartEndItem? item,
    AppThemeData theme,
  ) {
    if (item == null) {
      return (null, null);
    }
    switch (item.type) {
      case AoUiStartEndItemType.text:
        return (
          Align(
            widthFactor: 1,
            heightFactor: 1,
            child: Text(
              item.text!,
              style: theme.typography.bodyLarge.copyWith(
                color: theme.colors.onSurface.withOpacity(0.6),
              ),
            ),
          ),
          null,
        );
      case AoUiStartEndItemType.icon:
        return (
          Icon(item.icon!, size: 24, color: theme.colors.onSurface),
          null,
        );
      case AoUiStartEndItemType.iconButton:
        return (
          AoUiIconButton(
            type: item.buttonType!,
            size: AoUiIconButtonSize.l,
            onPressed: item.onButtonTap!,
            iconData: item.icon!,
          ),
          null,
        );
    }
  }
}

class AoUiTextFieldStartEndItem {
  final IconData? icon;
  final String? text;
  final AoUiIconButtonType? buttonType;
  final VoidCallback? onButtonTap;
  final AoUiStartEndItemType type;

  const AoUiTextFieldStartEndItem.text(this.text)
    : icon = null,
      buttonType = null,
      onButtonTap = null,
      type = AoUiStartEndItemType.text;

  const AoUiTextFieldStartEndItem.icon(this.icon)
    : text = null,
      buttonType = null,
      onButtonTap = null,
      type = AoUiStartEndItemType.icon;

  const AoUiTextFieldStartEndItem.iconButton({
    required this.icon,
    required this.onButtonTap,
    this.buttonType = AoUiIconButtonType.ghost,
  }) : text = null,
       type = AoUiStartEndItemType.iconButton;
}

enum AoUiStartEndItemType { text, icon, iconButton }
