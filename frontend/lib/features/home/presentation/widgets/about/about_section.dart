import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/responsive/responsive_builder.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_container.dart';
import '../../../../../core/widgets/app_section.dart';
import '../../../../../core/widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const _stats = [
    (value: '2.5+', label: 'Years Experience'),
    (value: '3+', label: 'Major Projects'),
    (value: 'Android • iOS • Web', label: 'Cross-Platform Development'),
  ];

  @override
  Widget build(BuildContext context) {
    return AppSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'About Me'),
          const SizedBox(height: AppSizes.space32),
          ResponsiveBuilder(
            mobile: (_) => Column(
              children: [
                const _AboutCopy(),
                const SizedBox(height: AppSizes.space24),
                _StatsGrid(columns: 1, stats: _stats),
              ],
            ),
            tablet: (_) => Column(
              children: [
                const _AboutCopy(),
                const SizedBox(height: AppSizes.space24),
                _StatsGrid(columns: 3, stats: _stats),
              ],
            ),
            desktop: (_) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 5, child: _AboutCopy()),
                const SizedBox(width: AppSizes.space48),
                Expanded(flex: 4, child: _StatsGrid(columns: 1, stats: _stats)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutCopy extends StatelessWidget {
  const _AboutCopy();

  @override
  Widget build(BuildContext context) {
    return Text(AppStrings.about, style: AppTextStyles.bodyLarge);
  }
}

class _StatsGrid extends StatelessWidget {
  const _StatsGrid({required this.columns, required this.stats});

  final int columns;
  final List<({String value, String label})> stats;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth =
            (constraints.maxWidth - (columns - 1) * AppSizes.space16) / columns;

        return Wrap(
          spacing: AppSizes.space16,
          runSpacing: AppSizes.space16,
          children: stats
              .map(
                (stat) => SizedBox(
                  width: cardWidth,
                  child: StatItem(value: stat.value, label: stat.label),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class StatItem extends StatelessWidget {
  const StatItem({required this.value, required this.label, super.key});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: const EdgeInsets.all(AppSizes.space20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: AppTextStyles.headingMedium.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.space8),
          Text(label, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }
}
