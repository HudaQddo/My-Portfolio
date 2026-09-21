import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/responsive/responsive_builder.dart';
import '../../../../../core/responsive/responsive_extensions.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_section.dart';
import '../../../../../core/widgets/fade_slide_in.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/widgets/secondary_button.dart';
import '../../../../../core/widgets/social_button.dart';
import '../../../../contact/data/contact_data.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    required this.onViewProjects,
    required this.onContact,
    super.key,
  });

  final VoidCallback onViewProjects;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    return AppSection(
      padding: EdgeInsets.only(
        left: context.pagePadding.horizontal / 2,
        right: context.pagePadding.horizontal / 2,
        top: context.isMobile ? AppSizes.space48 : AppSizes.space96,
        bottom: context.isMobile ? AppSizes.space48 : AppSizes.space64,
      ),
      child: ResponsiveBuilder(
        mobile: (_) =>
            _HeroColumn(onViewProjects: onViewProjects, onContact: onContact),
        desktop: (_) => Row(
          children: [
            Expanded(
              child: _HeroContent(
                onViewProjects: onViewProjects,
                onContact: onContact,
              ),
            ),
            const SizedBox(width: AppSizes.space64),
            const Expanded(child: _HeroVisual()),
          ],
        ),
      ),
    );
  }
}

class _HeroColumn extends StatelessWidget {
  const _HeroColumn({required this.onViewProjects, required this.onContact});

  final VoidCallback onViewProjects;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeroContent(onViewProjects: onViewProjects, onContact: onContact),
        const SizedBox(height: AppSizes.space48),
        const _HeroVisual(),
      ],
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent({required this.onViewProjects, required this.onContact});

  final VoidCallback onViewProjects;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.isMobile
        ? AppTextStyles.displayMedium
        : AppTextStyles.displayLarge;

    return FadeSlideIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.heroEyebrow, style: AppTextStyles.label),
          const SizedBox(height: AppSizes.space16),
          Text(AppStrings.name.toUpperCase(), style: titleStyle),
          const SizedBox(height: AppSizes.space16),
          Text(
            AppStrings.role,
            style: AppTextStyles.headingMedium.copyWith(
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppSizes.space24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 610),
            child: Text(
              AppStrings.heroDescription,
              style: AppTextStyles.bodyLarge,
            ),
          ),
          const SizedBox(height: AppSizes.space32),
          Wrap(
            spacing: AppSizes.space16,
            runSpacing: AppSizes.space12,
            children: [
              PrimaryButton(
                label: 'View Projects',
                icon: Icons.work_outline_rounded,
                onPressed: onViewProjects,
              ),
              SecondaryButton(
                label: 'Contact Me',
                icon: Icons.mail_outline_rounded,
                onPressed: onContact,
              ),
            ],
          ),
          const SizedBox(height: AppSizes.space24),
          Wrap(
            spacing: AppSizes.space8,
            runSpacing: AppSizes.space8,
            children: ContactData.socialLinks
                .map((link) => SocialButton(label: link.label, url: link.url))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: context.isMobile ? 1 : 0.94,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radius20),
          border: Border.all(color: AppColors.border),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 34,
              right: 34,
              child: _BrandMark(size: context.isMobile ? 86 : 114),
            ),
            const Positioned(
              left: 34,
              bottom: 34,
              right: 76,
              child: _MockupCard(),
            ),
            Positioned(
              left: context.isMobile ? 22 : 46,
              top: context.isMobile ? 76 : 102,
              child: Container(
                width: context.isMobile ? 92 : 124,
                height: context.isMobile ? 92 : 124,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppSizes.radius20),
                  border: Border.all(color: AppColors.border),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.deepDark,
        borderRadius: BorderRadius.circular(AppSizes.radius20),
        border: Border.all(color: AppColors.primary),
      ),
      child: Text(
        AppStrings.initials,
        style: AppTextStyles.headingLarge.copyWith(color: AppColors.primary),
      ),
    );
  }
}

class _MockupCard extends StatelessWidget {
  const _MockupCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.space20),
      decoration: BoxDecoration(
        color: AppColors.deepDark,
        borderRadius: BorderRadius.circular(AppSizes.radius16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _StatusDot(color: AppColors.primary),
              const SizedBox(width: AppSizes.space8),
              _StatusDot(color: AppColors.secondary),
              const SizedBox(width: AppSizes.space8),
              _StatusDot(color: AppColors.beige),
            ],
          ),
          const SizedBox(height: AppSizes.space24),
          _MockupLine(width: 0.9),
          const SizedBox(height: AppSizes.space12),
          _MockupLine(width: 0.65),
          const SizedBox(height: AppSizes.space24),
          Row(
            children: const [
              Expanded(child: _MetricTile(label: 'Mobile')),
              SizedBox(width: AppSizes.space12),
              Expanded(child: _MetricTile(label: 'Delivery')),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 9,
      height: 9,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _MockupLine extends StatelessWidget {
  const _MockupLine({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: width,
      alignment: Alignment.centerLeft,
      child: Container(
        height: 12,
        decoration: BoxDecoration(
          color: AppColors.surfaceSecondary,
          borderRadius: BorderRadius.circular(AppSizes.radius8),
        ),
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius12),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(label, style: AppTextStyles.label),
    );
  }
}
