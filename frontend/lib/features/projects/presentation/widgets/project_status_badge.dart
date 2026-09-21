import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProjectStatusBadge extends StatelessWidget {
  const ProjectStatusBadge({required this.label, super.key});
  final String label;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(
      horizontal: AppSizes.space12,
      vertical: AppSizes.space8,
    ),
    decoration: BoxDecoration(
      color: AppColors.primary.withValues(alpha: 0.12),
      border: Border.all(color: AppColors.primary),
      borderRadius: BorderRadius.circular(AppSizes.radius8),
    ),
    child: Text(label, style: AppTextStyles.label),
  );
}
