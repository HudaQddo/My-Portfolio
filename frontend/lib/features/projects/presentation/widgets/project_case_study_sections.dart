import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/responsive/responsive_extensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_container.dart';
import '../../../../core/widgets/app_section.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/project.dart';
import 'project_technology_list.dart';
import 'project_process.dart';

class ProjectDetailsSection extends StatelessWidget {
  const ProjectDetailsSection({
    required this.title,
    required this.child,
    super.key,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) => AppSection(
    padding: EdgeInsets.only(
      left: context.pagePadding.horizontal / 2,
      right: context.pagePadding.horizontal / 2,
      bottom: AppSizes.space48,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title),
        const SizedBox(height: AppSizes.space24),
        child,
      ],
    ),
  );
}

/// Natural-height cards keep long content and larger text sizes readable.
class ProjectCardLayout extends StatelessWidget {
  const ProjectCardLayout({
    required this.children,
    this.desktopColumns = 2,
    super.key,
  });

  final List<Widget> children;
  final int desktopColumns;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final columns = context.isMobile
          ? 1
          : context.isTablet
          ? 2
          : desktopColumns;
      final width =
          (constraints.maxWidth - AppSizes.space16 * (columns - 1)) / columns;
      return Wrap(
        spacing: AppSizes.space16,
        runSpacing: AppSizes.space16,
        children: children
            .map((child) => SizedBox(width: width, child: child))
            .toList(),
      );
    },
  );
}

class ProjectRoleSection extends StatelessWidget {
  const ProjectRoleSection({required this.project, super.key});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final study = project.caseStudy!;
    return ProjectDetailsSection(
      title: 'My Role',
      child: ProjectCardLayout(
        children: study.roles.indexed
            .map(
              (entry) => ProjectContentCard(
                eyebrow:
                    '0${entry.$1 + 1} / ${entry.$2.label ?? entry.$2.title}',
                title: entry.$2.title,
                description: entry.$2.description,
                emphasized: true,
              ),
            )
            .toList(),
      ),
    );
  }
}

class ProjectEcosystem extends StatelessWidget {
  const ProjectEcosystem({
    required this.project,
    this.compact = false,
    super.key,
  });
  final Project project;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final applications = project.caseStudy!.applications;
    if (compact) {
      return AppContainer(
        isElevated: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ONE CONNECTED ECOSYSTEM', style: AppTextStyles.label),
            const SizedBox(height: AppSizes.space16),
            Text(project.title, style: AppTextStyles.headingLarge),
            const SizedBox(height: AppSizes.space8),
            Text(project.subtitle, style: AppTextStyles.bodyMedium),
            const SizedBox(height: AppSizes.space24),
            ...applications.indexed.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.space12),
                child: AppContainer(
                  padding: const EdgeInsets.all(AppSizes.space16),
                  child: Row(
                    children: [
                      Icon(
                        entry.$2.platform == 'Desktop'
                            ? Icons.desktop_windows_outlined
                            : Icons.phone_android_outlined,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: AppSizes.space16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(entry.$2.name, style: AppTextStyles.label),
                            const SizedBox(height: AppSizes.space4),
                            Text(
                              entry.$2.platform,
                              style: AppTextStyles.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Text('0${entry.$1 + 1}', style: AppTextStyles.label),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return ProjectCardLayout(
      desktopColumns: 3,
      children: applications.indexed.map((entry) {
        final app = entry.$2;
        return AppContainer(
          isElevated: app.contribution != null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '0${entry.$1 + 1} / ${app.platform}',
                style: AppTextStyles.label,
              ),
              const SizedBox(height: AppSizes.space16),
              Text(app.name, style: AppTextStyles.headingMedium),
              const SizedBox(height: AppSizes.space12),
              Text(app.description, style: AppTextStyles.bodyMedium),
              if (app.contribution != null) ...[
                const SizedBox(height: AppSizes.space16),
                Text(app.contribution!, style: AppTextStyles.label),
              ],
              const Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.space16),
                child: Divider(color: AppColors.border, height: 1),
              ),
              ...app.modules.map(
                (module) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSizes.space16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(module.title, style: AppTextStyles.label),
                      const SizedBox(height: AppSizes.space8),
                      Text(module.description, style: AppTextStyles.bodyMedium),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class ProjectResponsibilitySection extends StatelessWidget {
  const ProjectResponsibilitySection({
    required this.title,
    required this.items,
    this.journey = const [],
    super.key,
  });
  final String title;
  final List<ProjectContentGroup> items;
  final List<String> journey;

  @override
  Widget build(BuildContext context) => ProjectDetailsSection(
    title: title,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectCardLayout(
          children: items.indexed
              .map(
                (entry) => ProjectContentCard(
                  eyebrow: entry.$2.label ?? '0${entry.$1 + 1}',
                  title: entry.$2.title,
                  description: entry.$2.description,
                ),
              )
              .toList(),
        ),
        if (journey.isNotEmpty) ...[
          const SizedBox(height: AppSizes.space24),
          Text('Project journey', style: AppTextStyles.label),
          const SizedBox(height: AppSizes.space12),
          ProjectProcess(steps: journey),
        ],
      ],
    ),
  );
}

class ProjectChallengeSection extends StatelessWidget {
  const ProjectChallengeSection({required this.study, super.key});
  final ProjectCaseStudy study;

  @override
  Widget build(BuildContext context) => ProjectDetailsSection(
    title: 'Key Challenge & Approach',
    child: ProjectCardLayout(
      children: [
        ProjectContentCard(
          eyebrow: 'THE CHALLENGE',
          title: study.challengeTitle,
          description: study.challenge!,
        ),
        ProjectContentCard(
          eyebrow: 'OUR APPROACH',
          title: study.approachTitle,
          description: study.approach!,
        ),
      ],
    ),
  );
}

class ProjectTechnicalSection extends StatelessWidget {
  const ProjectTechnicalSection({required this.project, super.key});
  final Project project;

  @override
  Widget build(BuildContext context) => ProjectDetailsSection(
    title: project.caseStudy!.technicalTitle,
    child: AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.caseStudy!.technicalContribution,
            style: AppTextStyles.bodyLarge,
          ),
          const SizedBox(height: AppSizes.space24),
          if (project.caseStudy!.implementationTechnologies.isNotEmpty) ...[
            Text('My implementation', style: AppTextStyles.label),
            const SizedBox(height: AppSizes.space12),
            ProjectTechnologyList(
              technologies: project.caseStudy!.implementationTechnologies,
            ),
            const SizedBox(height: AppSizes.space24),
          ],
          Text('Project technologies', style: AppTextStyles.label),
          const SizedBox(height: AppSizes.space12),
          ProjectTechnologyList(technologies: project.technologies),
          if (project.caseStudy!.technicalNote case final note?) ...[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.space24),
              child: Divider(color: AppColors.border),
            ),
            Text(note.title, style: AppTextStyles.label),
            const SizedBox(height: AppSizes.space8),
            Text(note.description, style: AppTextStyles.bodyMedium),
          ],
        ],
      ),
    ),
  );
}

class ProjectContentCard extends StatelessWidget {
  const ProjectContentCard({
    required this.eyebrow,
    required this.title,
    required this.description,
    this.emphasized = false,
    super.key,
  });
  final String eyebrow;
  final String title;
  final String description;
  final bool emphasized;

  @override
  Widget build(BuildContext context) => AppContainer(
    isElevated: emphasized,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(eyebrow, style: AppTextStyles.label),
        const SizedBox(height: AppSizes.space16),
        Text(title, style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSizes.space12),
        Text(description, style: AppTextStyles.bodyMedium),
      ],
    ),
  );
}
