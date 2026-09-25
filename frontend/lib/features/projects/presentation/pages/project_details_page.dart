import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/responsive/responsive_builder.dart';
import '../../../../core/responsive/responsive_extensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_container.dart';
import '../../../../core/widgets/app_section.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/secondary_button.dart';
import '../../data/project_data.dart';
import '../../domain/entities/project.dart';
import '../widgets/project_gallery.dart';
import '../widgets/project_showcase.dart';
import '../widgets/project_technology_list.dart';
import '../widgets/project_case_study_sections.dart';
import '../widgets/project_evolution_timeline.dart';
import '../widgets/project_platform_showcase.dart';
import '../widgets/project_process.dart';
import '../widgets/project_status_badge.dart';
import '../widgets/project_feature_showcase.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({required this.projectId, super.key});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    final project = ProjectData.findById(projectId);
    if (project == null) {
      return const _ProjectNotFound();
    }

    final nextProject = ProjectData.nextProject(project.id);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.deepDark.withValues(alpha: 0.94),
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              tooltip: 'Back to portfolio',
              onPressed: () => context.go('/'),
              icon: const Icon(Icons.arrow_back_rounded),
            ),
            title: Text(project.title, style: AppTextStyles.label),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProjectHero(project: project),
                ProjectDetailsSection(
                  title: 'Project Overview',
                  child: Text(
                    project.description,
                    style: AppTextStyles.bodyLarge,
                  ),
                ),
                if (project.caseStudy != null) ...[
                  if (project.caseStudy!.evolution.isNotEmpty)
                    ProjectDetailsSection(
                      title: 'Product Evolution',
                      child: ProjectEvolutionTimeline(
                        steps: project.caseStudy!.evolution,
                      ),
                    ),
                  if (project.caseStudy!.roles.isNotEmpty)
                    ProjectRoleSection(project: project),
                  ...project.caseStudy!.features.map(
                    (feature) => ProjectFeatureShowcase(feature: feature),
                  ),
                  if (project.caseStudy!.ownership.isNotEmpty)
                    ProjectResponsibilitySection(
                      title: 'Frontend Ownership',
                      items: project.caseStudy!.ownership,
                      journey: project.caseStudy!.journey,
                    ),
                  if (project.caseStudy!.capabilities.isNotEmpty) ...[
                    ProjectDetailsSection(
                      title: 'Platform Capabilities',
                      child: ProjectCardLayout(
                        children: project.caseStudy!.capabilities.indexed
                            .map(
                              (entry) => ProjectContentCard(
                                eyebrow: '0${entry.$1 + 1}',
                                title: entry.$2.title,
                                description: entry.$2.description,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    if (project.caseStudy!.customerFlow.isNotEmpty)
                      ProjectDetailsSection(
                        title: 'Ordering Flow',
                        child: ProjectProcess(
                          steps: project.caseStudy!.customerFlow,
                        ),
                      ),
                    ProjectDetailsSection(
                      title: 'Web + Mobile',
                      child: ProjectPlatformShowcase(
                        applications: project.caseStudy!.applications,
                        caption: project.caseStudy!.platformCaption,
                      ),
                    ),
                  ] else if (project.caseStudy!.applications.isNotEmpty)
                    ProjectDetailsSection(
                      title: 'The Ecosystem',
                      child: ProjectEcosystem(project: project),
                    ),
                  if (project.caseStudy!.team.isNotEmpty)
                    ProjectResponsibilitySection(
                      title: 'Two-Developer Collaboration',
                      items: project.caseStudy!.team,
                    ),
                  if (project.caseStudy!.management.isNotEmpty)
                    ProjectResponsibilitySection(
                      title: 'Project Management',
                      items: project.caseStudy!.management,
                      journey: project.caseStudy!.journey,
                    ),
                  if (project.caseStudy!.challenge != null &&
                      project.caseStudy!.approach != null)
                    ProjectChallengeSection(study: project.caseStudy!),
                  ProjectTechnicalSection(project: project),
                  if (project.status case final status?)
                    ProjectDetailsSection(
                      title: 'Production Delivery',
                      child: AppContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProjectStatusBadge(label: status.title),
                            const SizedBox(height: AppSizes.space16),
                            Text(
                              status.description,
                              style: AppTextStyles.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                ] else ...[
                  ProjectDetailsSection(
                    title: 'My Role',
                    child: AppContainer(
                      child: Text(
                        project.role,
                        style: AppTextStyles.headingMedium,
                      ),
                    ),
                  ),
                  ProjectDetailsSection(
                    title: 'Responsibilities',
                    child: AppContainer(
                      child: _BulletList(items: project.contributions),
                    ),
                  ),
                  ProjectDetailsSection(
                    title: 'Technology Stack',
                    child: AppContainer(
                      child: ProjectTechnologyList(
                        technologies: project.technologies,
                      ),
                    ),
                  ),
                ],
                if (project.images.isNotEmpty)
                  ProjectDetailsSection(
                    title: 'Screenshots / Gallery',
                    child: AppContainer(
                      child: ProjectGallery(items: project.images),
                    ),
                  ),
                AppSection(
                  child: AppContainer(
                    padding: const EdgeInsets.all(AppSizes.space32),
                    child: Flex(
                      direction: context.isMobile
                          ? Axis.vertical
                          : Axis.horizontal,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Next Project', style: AppTextStyles.label),
                              const SizedBox(height: AppSizes.space8),
                              Text(
                                nextProject.title,
                                style: AppTextStyles.headingMedium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: AppSizes.space16,
                          height: AppSizes.space16,
                        ),
                        PrimaryButton(
                          label: 'Open',
                          icon: Icons.arrow_forward_rounded,
                          onPressed: () => context.go(nextProject.route),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.space48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectHero extends StatelessWidget {
  const _ProjectHero({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final heading = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Case Study', style: AppTextStyles.label),
        const SizedBox(height: AppSizes.space16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 860),
          child: Text(project.title, style: AppTextStyles.displayMedium),
        ),
        const SizedBox(height: AppSizes.space16),
        Text(project.subtitle, style: AppTextStyles.bodyLarge),
        if (project.context != null) ...[
          const SizedBox(height: AppSizes.space12),
          Text(project.context!, style: AppTextStyles.bodyMedium),
        ],
        if (project.status != null) ...[
          const SizedBox(height: AppSizes.space16),
          ProjectStatusBadge(label: project.status!.title),
        ],
        if (project.caseStudy != null) ...[
          const SizedBox(height: AppSizes.space16),
          Text(project.role, style: AppTextStyles.label),
          const SizedBox(height: AppSizes.space16),
          ProjectTechnologyList(technologies: project.caseStudy!.platforms),
        ],
        const SizedBox(height: AppSizes.space32),
        if (project.caseStudy == null)
          ProjectPreviewPanel(project: project, index: 0),
      ],
    );
    return AppSection(
      child: project.caseStudy == null
          ? heading
          : ResponsiveBuilder(
              mobile: (_) => heading,
              desktop: (_) => Row(
                children: [
                  Expanded(child: heading),
                  const SizedBox(width: AppSizes.space48),
                  Expanded(
                    child: ProjectPreviewPanel(project: project, index: 0),
                  ),
                ],
              ),
            ),
    );
  }
}

class _BulletList extends StatelessWidget {
  const _BulletList({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppSizes.space12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Icon(
                      Icons.circle,
                      size: 6,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: AppSizes.space12),
                  Expanded(child: Text(item, style: AppTextStyles.bodyMedium)),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ProjectNotFound extends StatelessWidget {
  const _ProjectNotFound();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: AppContainer(
          padding: const EdgeInsets.all(AppSizes.space32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Project not found', style: AppTextStyles.headingMedium),
              const SizedBox(height: AppSizes.space16),
              SecondaryButton(
                label: 'Back Home',
                icon: Icons.arrow_back_rounded,
                onPressed: () => context.go('/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
