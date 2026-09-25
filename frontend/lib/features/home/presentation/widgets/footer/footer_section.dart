import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/responsive/responsive_extensions.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_section.dart';
import '../../../../../core/widgets/app_logo.dart';
import '../../../../../core/widgets/social_button.dart';
import '../../../../contact/data/contact_data.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSection(
      padding: EdgeInsets.only(
        left: context.pagePadding.horizontal / 2,
        right: context.pagePadding.horizontal / 2,
        top: AppSizes.space32,
        bottom: AppSizes.space48,
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: AppSizes.space32),
          child: Wrap(
            spacing: AppSizes.space32,
            runSpacing: AppSizes.space24,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            children: [
              const _FooterIdentity(),
              Wrap(
                spacing: AppSizes.space8,
                runSpacing: AppSizes.space8,
                children: ContactData.socialLinks
                    .map(
                      (link) => SocialButton(label: link.label, url: link.url),
                    )
                    .toList(),
              ),
              Text('© Huda Qddo', style: AppTextStyles.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterIdentity extends StatelessWidget {
  const _FooterIdentity();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 360),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppLogo(),
          const SizedBox(width: AppSizes.space12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.name, style: AppTextStyles.label),
                Text(
                  AppStrings.role,
                  style: AppTextStyles.bodyMedium,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
