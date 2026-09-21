import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/responsive/responsive_builder.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/url_launcher_helper.dart';
import '../../../../../core/widgets/app_container.dart';
import '../../../../../core/widgets/app_section.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/widgets/social_button.dart';
import '../../../../contact/data/contact_data.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSection(
      child: AppContainer(
        padding: const EdgeInsets.all(AppSizes.space32),
        isElevated: true,
        child: ResponsiveBuilder(
          mobile: (_) => const _ContactContent(isCompact: true),
          desktop: (_) => const _ContactContent(isCompact: false),
        ),
      ),
    );
  }
}

class _ContactContent extends StatelessWidget {
  const _ContactContent({required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final details = const _ContactDetails();
    final copy = const _ContactCopy();

    if (isCompact) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          copy,
          const SizedBox(height: AppSizes.space32),
          details,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(child: _ContactCopy()),
        const SizedBox(width: AppSizes.space48),
        Expanded(child: details),
      ],
    );
  }
}

class _ContactCopy extends StatelessWidget {
  const _ContactCopy();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.contactHeading, style: AppTextStyles.headingLarge),
        const SizedBox(height: AppSizes.space16),
        Text(AppStrings.contactText, style: AppTextStyles.bodyLarge),
        const SizedBox(height: AppSizes.space24),
        PrimaryButton(
          label: 'Email Huda',
          icon: Icons.mail_outline_rounded,
          onPressed: () => UrlLauncherHelper.openEmail(ContactData.email),
        ),
      ],
    );
  }
}

class _ContactDetails extends StatelessWidget {
  const _ContactDetails();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ContactRow(
          icon: Icons.mail_outline_rounded,
          label: 'Email',
          value: ContactData.email,
        ),
        const _ContactRow(
          icon: Icons.business_center_rounded,
          label: 'LinkedIn',
          value: 'linkedin.com/in/huda-qddo',
        ),
        const _ContactRow(
          icon: Icons.code_rounded,
          label: 'GitHub',
          value: 'github.com/HudaQddo',
        ),
        const _ContactRow(
          icon: Icons.location_on_outlined,
          label: 'Location',
          value: ContactData.location,
        ),
        const SizedBox(height: AppSizes.space16),
        Wrap(
          spacing: AppSizes.space8,
          runSpacing: AppSizes.space8,
          children: ContactData.socialLinks
              .map(
                (link) => SocialButton(
                  label: link.label,
                  url: link.url,
                  icon: link.icon,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.space16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 22),
          const SizedBox(width: AppSizes.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.label),
                const SizedBox(height: AppSizes.space4),
                Text(value, style: AppTextStyles.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
