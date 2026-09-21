import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class HoverScale extends StatefulWidget {
  const HoverScale({required this.child, this.scale = 1.015, super.key});

  final Widget child;
  final double scale;

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        duration: AppSizes.animationMedium,
        curve: Curves.easeOutCubic,
        scale: _isHovered ? widget.scale : 1,
        child: widget.child,
      ),
    );
  }
}
