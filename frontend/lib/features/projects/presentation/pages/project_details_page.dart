import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/responsive/responsive_extensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_container.dart';
import '../../../../core/widgets/app_section.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/secondary_button.dart';
import '../../../../core/widgets/section_header.dart';
import '../../data/project_data.dart';
import '../../domain/entities/project.dart';
import '../widgets/project_gallery.dart';
import '../widgets/project_showcase.dart';
import '../widgets/project_technology_list.dart';

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
                _DetailsBlock(
                  title: 'Project Overview',
                  child: Text(
                    project.description,
                    style: AppTextStyles.bodyLarge,
                  ),
                ),
                _DetailsBlock(
                  title: 'My Role',
                  child: Text(project.role, style: AppTextStyles.headingMedium),
                ),
                _DetailsBlock(
                  title: 'Responsibilities',
                  child: _BulletList(items: project.contributions),
                ),
                _DetailsBlock(
                  title: 'Technology Stack',
                  child: ProjectTechnologyList(
                    technologies: project.technologies,
                  ),
                ),
                _DetailsBlock(
                  title: 'Screenshots / Gallery',
                  child: ProjectGallery(items: project.images),
                ),
                _DetailsBlock(
                  title: 'Key Contributions',
                  child: _BulletList(items: project.contributions),
                ),
                AppSection(
                  child: AppContainer(
                    padding: const EdgeInsets.all(AppSizes.space32),
                    child: Row(
                      children: [
                        Expanded(
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
                        const SizedBox(width: AppSizes.space16),
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
    return AppSection(
      child: Column(
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
          const SizedBox(height: AppSizes.space32),
          ProjectPreviewPanel(project: project, index: 0),
        ],
      ),
    );
  }
}

class _DetailsBlock extends StatelessWidget {
  const _DetailsBlock({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppSection(
      padding: EdgeInsets.only(
        left: context.pagePadding.horizontal / 2,
        right: context.pagePadding.horizontal / 2,
        bottom: AppSizes.space24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: title),
          const SizedBox(height: AppSizes.space24),
          AppContainer(child: child),
        ],
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
