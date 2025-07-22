import 'package:flutter/material.dart';
import 'package:aouikit/atoms/button/ao_button.dart';

/// AoUiMobileButtonBlock es un widget que muestra una fila de botones.
///
/// Ejemplo:
/// ```dart
/// AoUiMobileButtonBlock(
///   style: AoUiMobileButtonBlockStyle(
///     style: AoUiMobileButtonBlockStyleType.flexible,
///     left: AoUiButton(
///       label: 'Cancelar',
///       onPressed: () {},
///     ),
///     right: AoUiButton(
///       label: 'Guardar',
///       onPressed: () {},
///     ),
///   ),
/// )
/// ```
class AoUiMobileButtonBlock extends StatefulWidget {
  final AoUiMobileButtonBlockStyle style;

  const AoUiMobileButtonBlock({super.key, required this.style});

  @override
  State<AoUiMobileButtonBlock> createState() => _AoUiMobileButtonBlockState();
}

class _AoUiMobileButtonBlockState extends State<AoUiMobileButtonBlock> {
  double? _width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        _width = constraints.maxWidth;

        return SizedBox(
          width: _width ?? 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment:
                    (widget.style.style == AoUiMobileButtonBlockStyleType.one)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: _wrapInExpanded(widget.style.getButtons(_width ?? 0)),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _wrapInExpanded(List<Widget> children) {
    if (widget.style.style == AoUiMobileButtonBlockStyleType.flexible) {
      return children;
    } else {
      return children.map((widget) => Expanded(child: widget)).toList();
    }
  }
}

class AoUiMobileButtonBlockStyle {
  AoUiButton? left;
  AoUiButton? right;
  AoUiButton? button;
  Widget? rightButtonWidget;
  final AoUiMobileButtonBlockStyleType style;

  AoUiMobileButtonBlockStyle({
    required this.style,
    this.left,
    this.right,
    this.button,
  }) {
    if (style == AoUiMobileButtonBlockStyleType.flexible) {
      assert(left != null && right != null);
    } else if (style == AoUiMobileButtonBlockStyleType.two) {
      assert(left != null && right != null);
    } else {
      assert(button != null);
    }
  }

  List<Widget> getButtons(double width) {
    if (right != null && style == AoUiMobileButtonBlockStyleType.flexible) {
      rightButtonWidget = Flexible(
        child: Container(
          constraints: BoxConstraints(minWidth: width),
          child: right,
        ),
      );
    } else {
      rightButtonWidget = right;
    }

    return [
      left,
      button,
      rightButtonWidget,
    ].where((widget) => widget != null).cast<Widget>().toList();
  }
}

enum AoUiMobileButtonBlockStyleType { one, two, flexible }
