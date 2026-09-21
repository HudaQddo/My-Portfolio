import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import '../responsive/responsive_extensions.dart';

class AppSection extends StatelessWidget {
  const AppSection({required this.child, this.padding, super.key});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ??
          EdgeInsets.symmetric(
            vertical: context.sectionSpacing / 2,
          ).add(context.pagePadding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
          child: child,
        ),
      ),
    );
  }
}
