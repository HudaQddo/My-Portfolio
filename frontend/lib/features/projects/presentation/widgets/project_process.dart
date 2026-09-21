import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/responsive/responsive_extensions.dart';
import '../../../../core/theme/app_text_styles.dart';

/// A lightweight sequence that becomes vertical on narrow screens.
class ProjectProcess extends StatelessWidget {
  const ProjectProcess({required this.steps, super.key});
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    final vertical = context.isMobile;
    final children = <Widget>[];
    for (final (index, step) in steps.indexed) {
      if (index > 0) {
        children.add(
          Padding(
            padding: const EdgeInsets.all(AppSizes.space8),
            child: Icon(
              vertical
                  ? Icons.arrow_downward_rounded
                  : Icons.arrow_forward_rounded,
              size: 16,
              color: AppColors.secondary,
            ),
          ),
        );
      }
      children.add(Text(step, style: AppTextStyles.bodyMedium));
    }
    return SizedBox(
      width: double.infinity,
      child: vertical
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            )
          : Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: AppSizes.space8,
              children: children,
            ),
    );
  }
}
