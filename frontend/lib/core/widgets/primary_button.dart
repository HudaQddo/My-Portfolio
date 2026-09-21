import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.semanticLabel,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final child = icon == null
        ? Text(label)
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18),
              const SizedBox(width: 8),
              Flexible(child: Text(label)),
            ],
          );

    return Semantics(
      button: true,
      label: semanticLabel ?? label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: FilledButton(onPressed: onPressed, child: child),
      ),
    );
  }
}
