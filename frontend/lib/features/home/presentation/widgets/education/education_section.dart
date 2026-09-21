import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_container.dart';
import '../../../../../core/widgets/app_section.dart';
import '../../../../../core/widgets/section_header.dart';
import '../../../../education/data/education_data.dart';
import '../../../../education/domain/entities/education.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Education'),
          const SizedBox(height: AppSizes.space32),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 760;
              final items = EducationData.items
                  .map((item) => EducationItem(education: item))
                  .toList();

              if (!isWide) {
                return Column(
                  children: items
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppSizes.space16,
                          ),
                          child: item,
                        ),
                      )
                      .toList(),
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: items
                    .map(
                      (item) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: AppSizes.space16,
                          ),
                          child: item,
                        ),
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

class EducationItem extends StatelessWidget {
  const EducationItem({required this.education, super.key});

  final Education education;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.school_outlined, color: AppColors.primary),
          const SizedBox(height: AppSizes.space16),
          Text(education.title, style: AppTextStyles.headingMedium),
          const SizedBox(height: AppSizes.space12),
          Text(education.institution, style: AppTextStyles.label),
          const SizedBox(height: AppSizes.space8),
          Text(education.period, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }
}
