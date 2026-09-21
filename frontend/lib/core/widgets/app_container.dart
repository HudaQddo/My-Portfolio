import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import '../theme/app_theme_extensions.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    required this.child,
    this.padding = const EdgeInsets.all(AppSizes.space24),
    this.isElevated = false,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool isElevated;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: isElevated
          ? context.portfolioDecorations.elevatedPanel
          : context.portfolioDecorations.panel,
      child: child,
    );
  }
}
