import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/responsive/responsive_extensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_container.dart';
import '../../domain/entities/project.dart';

class ProjectEvolutionTimeline extends StatelessWidget {
  const ProjectEvolutionTimeline({
    required this.steps,
    this.compact = false,
    super.key,
  });

  final List<ProjectContentGroup> steps;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final vertical = compact || !context.isDesktop;
    final children = <Widget>[];
    for (final (index, step) in steps.indexed) {
      final content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('0${index + 1}', style: AppTextStyles.label),
          const SizedBox(height: AppSizes.space12),
          Text(
            step.title,
            style: compact ? AppTextStyles.bodyLarge : AppTextStyles.label,
          ),
          if (!compact) ...[
            const SizedBox(height: AppSizes.space12),
            Text(step.description, style: AppTextStyles.bodyMedium),
          ],
        ],
      );
      final card = AppContainer(
        padding: const EdgeInsets.all(AppSizes.space16),
        isElevated: index == steps.length - 1,
        child: content,
      );
      children.add(vertical ? card : Expanded(child: card));
      if (index < steps.length - 1) {
        children.add(
          Padding(
            padding: const EdgeInsets.all(AppSizes.space4),
            child: Icon(
              vertical
                  ? Icons.arrow_downward_rounded
                  : Icons.arrow_forward_rounded,
              color: AppColors.secondary,
              size: 16,
            ),
          ),
        );
      }
    }
    return vertical
        ? Column(children: children)
        : Row(crossAxisAlignment: CrossAxisAlignment.start, children: children);
  }
}
