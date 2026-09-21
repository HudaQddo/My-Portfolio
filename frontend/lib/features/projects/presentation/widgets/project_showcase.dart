import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/responsive/responsive_builder.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_container.dart';
import '../../../../core/widgets/hover_scale.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/tech_chip.dart';
import '../../domain/entities/project.dart';
import 'project_case_study_sections.dart';
import 'project_evolution_timeline.dart';
import 'project_process.dart';
import 'project_status_badge.dart';
import 'project_technology_list.dart';

class ProjectShowcase extends StatelessWidget {
  const ProjectShowcase({
    required this.index,
    required this.project,
    required this.onViewCaseStudy,
    super.key,
  });

  final int index;
  final Project project;
  final VoidCallback onViewCaseStudy;

  @override
  Widget build(BuildContext context) {
    final preview = ProjectPreviewPanel(project: project, index: index);
    final content = _ProjectContent(
      index: index,
      project: project,
      onViewCaseStudy: onViewCaseStudy,
    );

    return HoverScale(
      child: ResponsiveBuilder(
        mobile: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            preview,
            const SizedBox(height: AppSizes.space24),
            content,
          ],
        ),
        desktop: (_) {
          final children = [
            Expanded(child: preview),
            const SizedBox(width: AppSizes.space48),
            Expanded(child: content),
          ];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: index.isOdd ? children.reversed.toList() : children,
          );
        },
      ),
    );
  }
}

class _ProjectContent extends StatelessWidget {
  const _ProjectContent({
    required this.index,
    required this.project,
    required this.onViewCaseStudy,
  });

  final int index;
  final Project project;
  final VoidCallback onViewCaseStudy;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: const EdgeInsets.all(AppSizes.space32),
      isElevated: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.caseStudy != null
                ? 'FEATURED / 0${index + 1}'
                : '0${index + 1}',
            style: AppTextStyles.label.copyWith(color: AppColors.secondary),
          ),
          const SizedBox(height: AppSizes.space12),
          Text(project.title, style: AppTextStyles.headingMedium),
          if (project.status != null) ...[
            const SizedBox(height: AppSizes.space12),
            ProjectStatusBadge(label: project.status!.title),
          ],
          if (project.caseStudy != null) ...[
            const SizedBox(height: AppSizes.space8),
            Text(project.subtitle, style: AppTextStyles.bodyLarge),
          ],
          const SizedBox(height: AppSizes.space8),
          Text(
            project.role,
            style: AppTextStyles.label.copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: AppSizes.space16),
          Text(
            project.caseStudy?.summary ?? project.description,
            style: AppTextStyles.bodyMedium,
          ),
          if (project.caseStudy != null) ...[
            const SizedBox(height: AppSizes.space20),
            Wrap(
              spacing: AppSizes.space16,
              runSpacing: AppSizes.space12,
              children: project.caseStudy!.indicators
                  .map((label) => Text(label, style: AppTextStyles.label))
                  .toList(),
            ),
          ],
          const SizedBox(height: AppSizes.space20),
          if (project.caseStudy?.implementationTechnologies.isNotEmpty ??
              false) ...[
            Text('Project stack', style: AppTextStyles.label),
            const SizedBox(height: AppSizes.space8),
          ],
          Wrap(
            spacing: AppSizes.space8,
            runSpacing: AppSizes.space8,
            children:
                (project.caseStudy?.featuredTechnologies ??
                        project.technologies)
                    .map((technology) => TechChip(label: technology))
                    .toList(),
          ),
          const SizedBox(height: AppSizes.space24),
          PrimaryButton(
            label: project.caseStudy != null
                ? 'Explore Case Study'
                : 'View Case Study',
            icon: Icons.arrow_forward_rounded,
            onPressed: onViewCaseStudy,
          ),
        ],
      ),
    );
  }
}

class ProjectPreviewPanel extends StatelessWidget {
  const ProjectPreviewPanel({
    required this.project,
    required this.index,
    super.key,
  });

  final Project project;
  final int index;

  @override
  Widget build(BuildContext context) {
    final study = project.caseStudy;
    if (study != null && study.ownership.isNotEmpty) {
      return AppContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('FRONTEND DELIVERY', style: AppTextStyles.label),
            const SizedBox(height: AppSizes.space16),
            Text(project.title, style: AppTextStyles.headingLarge),
            const SizedBox(height: AppSizes.space24),
            ProjectTechnologyList(technologies: study.platforms),
            const SizedBox(height: AppSizes.space24),
            ProjectProcess(steps: study.journey),
            if (project.status != null) ...[
              const SizedBox(height: AppSizes.space24),
              ProjectStatusBadge(label: project.status!.title),
            ],
          ],
        ),
      );
    }
    final evolution = project.caseStudy?.evolution;
    if (evolution != null && evolution.isNotEmpty) {
      return AppContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('PRODUCT EVOLUTION', style: AppTextStyles.label),
            const SizedBox(height: AppSizes.space16),
            Text(project.title, style: AppTextStyles.headingLarge),
            const SizedBox(height: AppSizes.space24),
            ProjectEvolutionTimeline(
              steps: [evolution.first, evolution.last],
              compact: true,
            ),
          ],
        ),
      );
    }
    if (project.caseStudy != null) {
      return ProjectEcosystem(project: project, compact: true);
    }
    return AspectRatio(
      aspectRatio: 1.45,
      child: Container(
        padding: const EdgeInsets.all(AppSizes.space24),
        decoration: BoxDecoration(
          color: AppColors.deepDark,
          borderRadius: BorderRadius.circular(AppSizes.radius16),
          border: Border.all(color: AppColors.border),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(project.subtitle, style: AppTextStyles.bodyMedium),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _DevicePreview(project: project, index: index),
            ),
          ],
        ),
      ),
    );
  }
}

class _DevicePreview extends StatelessWidget {
  const _DevicePreview({required this.project, required this.index});

  final Project project;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      padding: const EdgeInsets.all(AppSizes.space16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(_iconForType(project.type), color: AppColors.primary),
              const SizedBox(width: AppSizes.space12),
              Expanded(
                child: Text(
                  project.title,
                  style: AppTextStyles.label.copyWith(color: AppColors.cream),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.space16),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                3,
                (itemIndex) => Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      right: itemIndex == 2 ? 0 : AppSizes.space12,
                    ),
                    decoration: BoxDecoration(
                      color: itemIndex == index % 3
                          ? AppColors.primary.withValues(alpha: 0.22)
                          : AppColors.surfaceSecondary,
                      borderRadius: BorderRadius.circular(AppSizes.radius12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.layers_rounded,
                        color: itemIndex == index % 3
                            ? AppColors.primary
                            : AppColors.secondary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForType(ProjectType type) {
    return switch (type) {
      ProjectType.mobile => Icons.phone_android_rounded,
      ProjectType.web => Icons.desktop_windows_rounded,
      ProjectType.platform => Icons.dashboard_customize_rounded,
    };
  }
}
