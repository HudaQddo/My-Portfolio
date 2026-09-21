import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../theme/app_text_styles.dart';
import '../utils/url_launcher_helper.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.label,
    required this.url,
    this.icon = Icons.open_in_new_rounded,
    super.key,
  });

  final String label;
  final String url;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      link: true,
      label: label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppSizes.radius8),
          onTap: () => UrlLauncherHelper.openExternal(url),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.space12,
              vertical: AppSizes.space8,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: AppTextStyles.label),
                const SizedBox(width: AppSizes.space8),
                Icon(icon, size: 16, color: AppColors.primary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
