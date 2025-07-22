import 'package:flutter/material.dart';
import '../../aouikit.dart';

class AOUIAccordion extends StatefulWidget {
  final String title;
  final String subtitle;

  const AOUIAccordion({super.key, required this.title, required this.subtitle});

  @override
  State<AOUIAccordion> createState() => _AOUIAccordionState();
}

class _AOUIAccordionState extends State<AOUIAccordion> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.colors.outline, width: 1),
        borderRadius: BorderRadius.circular(36.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        textColor: theme.colors.onSurface,
        iconColor: theme.colors.onSurface,
        collapsedTextColor: theme.colors.onSurface,
        collapsedIconColor: theme.colors.onSurface,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Text(
            widget.title,
            style: theme.typography.titleLarge, // ajusta según tu tipografía
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Icon(
            _isExpanded ? Icons.remove : Icons.add,
            color: theme.colors.onSurface,
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: ListTile(
              title: Text(
                widget.subtitle,
                style:
                    theme.typography.bodyMedium, // ajusta según tu tipografía
              ),
            ),
          ),
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
      ),
    );
  }
}
