import 'package:flutter/material.dart';

import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_container.dart';
import '../../../../../core/widgets/app_section.dart';
import '../../../../../core/widgets/section_header.dart';
import '../../../../../core/widgets/tech_chip.dart';
import '../../../../skills/data/skills_data.dart';
import '../../../../skills/domain/entities/skill_category.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Skills'),
          const SizedBox(height: AppSizes.space48),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth > 980
                  ? 3
                  : constraints.maxWidth > 640
                  ? 2
                  : 1;
              final cardWidth =
                  (constraints.maxWidth - (columns - 1) * AppSizes.space16) /
                  columns;

              return Wrap(
                spacing: AppSizes.space16,
                runSpacing: AppSizes.space16,
                children: SkillsData.categories
                    .map(
                      (category) => SizedBox(
                        width: cardWidth,
                        child: SkillCategoryCard(category: category),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SkillCategoryCard extends StatelessWidget {
  const SkillCategoryCard({required this.category, super.key});

  final SkillCategory category;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category.title, style: AppTextStyles.headingMedium),
          const SizedBox(height: AppSizes.space20),
          Wrap(
            spacing: AppSizes.space8,
            runSpacing: AppSizes.space8,
            children: category.skills
                .map(
                  (skill) => TechChip(
                    label: skill,
                    isEmphasized: skill == category.emphasizedSkill,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
