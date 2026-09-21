import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_container.dart';
import '../../domain/entities/project.dart';
import 'project_case_study_sections.dart';
import 'project_gallery.dart';

class ProjectPlatformShowcase extends StatelessWidget {
  const ProjectPlatformShowcase({
    required this.applications,
    required this.caption,
    super.key,
  });
  final List<ProjectApplication> applications;
  final String caption;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(caption, style: AppTextStyles.bodyLarge),
      const SizedBox(height: AppSizes.space24),
      ProjectCardLayout(
        children: applications
            .map(
              (app) => AppContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(app.name, style: AppTextStyles.headingMedium),
                    const SizedBox(height: AppSizes.space12),
                    Text(app.description, style: AppTextStyles.bodyMedium),
                    const SizedBox(height: AppSizes.space24),
                    Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: app.platform == 'Mobile'
                              ? 240
                              : double.infinity,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.deepDark,
                            border: Border.all(color: AppColors.border),
                            borderRadius: BorderRadius.circular(
                              AppSizes.radius16,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppSizes.space12),
                            child: Column(
                              children: [
                                Icon(
                                  app.platform == 'Mobile'
                                      ? Icons.phone_android_rounded
                                      : Icons.web_rounded,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(height: AppSizes.space12),
                                if (app.image != null)
                                  ProjectImagePreview(
                                    image: app.image!,
                                    aspectRatio: app.platform == 'Mobile'
                                        ? 0.6
                                        : 1.6,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    ],
  );
}
