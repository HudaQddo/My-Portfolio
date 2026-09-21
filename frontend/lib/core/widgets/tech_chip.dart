import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../theme/app_text_styles.dart';

class TechChip extends StatelessWidget {
  const TechChip({required this.label, this.isEmphasized = false, super.key});

  final String label;
  final bool isEmphasized;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.space12,
        vertical: AppSizes.space8,
      ),
      decoration: BoxDecoration(
        color: isEmphasized
            ? AppColors.primary.withValues(alpha: 0.16)
            : AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(AppSizes.radius8),
        border: Border.all(
          color: isEmphasized
              ? AppColors.primary.withValues(alpha: 0.5)
              : AppColors.border,
        ),
      ),
      child: Text(
        label,
        style: AppTextStyles.label.copyWith(
          color: isEmphasized ? AppColors.cream : AppColors.primary,
        ),
      ),
    );
  }
}
