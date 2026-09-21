import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_container.dart';
import '../../../../../core/widgets/app_section.dart';
import '../../../../../core/widgets/section_header.dart';
import '../../../../experience/data/experience_data.dart';
import '../../../../experience/domain/entities/experience.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Experience'),
          const SizedBox(height: AppSizes.space48),
          _Timeline(items: ExperienceData.items),
        ],
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  const _Timeline({required this.items});

  final List<Experience> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.indexed
          .map(
            (entry) => _TimelineItem(
              experience: entry.$2,
              isLast: entry.$1 == items.length - 1,
            ),
          )
          .toList(),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.experience, required this.isLast});

  final Experience experience;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.cream, width: 2),
                ),
              ),
              if (!isLast)
                Expanded(child: Container(width: 1, color: AppColors.border)),
            ],
          ),
          const SizedBox(width: AppSizes.space24),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : AppSizes.space32),
              child: AppContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: AppSizes.space12,
                      runSpacing: AppSizes.space8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          experience.title,
                          style: AppTextStyles.headingMedium,
                        ),
                        _Badge(label: experience.badge),
                      ],
                    ),
                    const SizedBox(height: AppSizes.space8),
                    Text(
                      '${experience.company} | ${experience.period}',
                      style: AppTextStyles.label,
                    ),
                    const SizedBox(height: AppSizes.space20),
                    ...experience.responsibilities.map(
                      (item) => _Responsibility(label: item),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.space12,
        vertical: AppSizes.space8,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(AppSizes.radius8),
      ),
      child: Text(label, style: AppTextStyles.label),
    );
  }
}

class _Responsibility extends StatelessWidget {
  const _Responsibility({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.space8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(Icons.circle, size: 6, color: AppColors.secondary),
          ),
          const SizedBox(width: AppSizes.space12),
          Expanded(child: Text(label, style: AppTextStyles.bodyMedium)),
        ],
      ),
    );
  }
}
