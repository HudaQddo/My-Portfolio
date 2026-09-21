import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/project.dart';
import 'project_case_study_sections.dart';

class ProjectGallery extends StatelessWidget {
  const ProjectGallery({required this.items, super.key});

  final List<ProjectImage> items;

  @override
  Widget build(BuildContext context) {
    return ProjectCardLayout(
      desktopColumns: 3,
      children: items.map((item) => ProjectImagePreview(image: item)).toList(),
    );
  }
}

class ProjectImagePreview extends StatelessWidget {
  const ProjectImagePreview({
    required this.image,
    this.aspectRatio = 1.6,
    super.key,
  });

  final ProjectImage image;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      padding: const EdgeInsets.all(AppSizes.space20),
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(AppSizes.radius12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.image_outlined, color: AppColors.primary),
          const SizedBox(height: AppSizes.space16),
          Text(image.caption, style: AppTextStyles.label),
          const SizedBox(height: AppSizes.space8),
          Text('Screenshot placeholder', style: AppTextStyles.bodyMedium),
        ],
      ),
    );
    if (image.assetPath == null) {
      return aspectRatio < 1
          ? AspectRatio(aspectRatio: aspectRatio, child: placeholder)
          : placeholder;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.radius12),
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: Image.asset(
              image.assetPath!,
              fit: BoxFit.contain,
              semanticLabel: image.caption,
              errorBuilder: (_, error, stack) => placeholder,
            ),
          ),
        ),
        const SizedBox(height: AppSizes.space12),
        Text(image.caption, style: AppTextStyles.label),
      ],
    );
  }
}
