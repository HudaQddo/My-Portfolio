import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/responsive/responsive_builder.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/project.dart';
import 'project_case_study_sections.dart';
import 'project_gallery.dart';
import 'project_process.dart';

/// Describes one implemented experience beside its real screenshots or slots.
class ProjectFeatureShowcase extends StatelessWidget {
  const ProjectFeatureShowcase({required this.feature, super.key});
  final ProjectFeature feature;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(feature.description, style: AppTextStyles.bodyLarge),
        ...feature.points.map(
          (point) => Padding(
            padding: const EdgeInsets.only(top: AppSizes.space24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (point.label != null) ...[
                  Text(point.label!, style: AppTextStyles.label),
                  const SizedBox(height: AppSizes.space8),
                ],
                Text(point.title, style: AppTextStyles.headingMedium),
                const SizedBox(height: AppSizes.space8),
                Text(point.description, style: AppTextStyles.bodyMedium),
              ],
            ),
          ),
        ),
        if (feature.flow.isNotEmpty) ...[
          const SizedBox(height: AppSizes.space24),
          ProjectProcess(steps: feature.flow),
        ],
      ],
    );
    final images = ProjectCardLayout(
      desktopColumns: feature.images.length == 1 ? 1 : 2,
      children: feature.images
          .map(
            (image) => Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 260),
                child: ProjectImagePreview(
                  image: image,
                  aspectRatio: image.assetPath == null ? 1.6 : 0.65,
                ),
              ),
            ),
          )
          .toList(),
    );
    return ProjectDetailsSection(
      title: feature.title,
      child: feature.images.isEmpty
          ? content
          : ResponsiveBuilder(
              mobile: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  content,
                  const SizedBox(height: AppSizes.space24),
                  images,
                ],
              ),
              desktop: (_) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: content),
                  const SizedBox(width: AppSizes.space48),
                  Expanded(flex: 2, child: images),
                ],
              ),
            ),
    );
  }
}
