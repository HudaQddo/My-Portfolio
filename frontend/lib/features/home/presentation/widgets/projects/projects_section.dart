import 'package:flutter/material.dart';

import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/widgets/app_section.dart';
import '../../../../../core/widgets/section_header.dart';
import '../../../../projects/data/project_data.dart';
import '../../../../projects/presentation/widgets/project_showcase.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({required this.onProjectSelected, super.key});

  final ValueChanged<String> onProjectSelected;

  @override
  Widget build(BuildContext context) {
    return AppSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Featured Projects',
            subtitle: AppStrings.projectsSubtitle,
          ),
          const SizedBox(height: AppSizes.space48),
          ...ProjectData.projects.indexed.map(
            (entry) => Padding(
              padding: EdgeInsets.only(
                bottom: entry.$1 == ProjectData.projects.length - 1
                    ? 0
                    : AppSizes.space48,
              ),
              child: ProjectShowcase(
                index: entry.$1,
                project: entry.$2,
                onViewCaseStudy: () => onProjectSelected(entry.$2.route),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
