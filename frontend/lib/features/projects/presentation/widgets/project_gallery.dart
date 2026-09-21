import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProjectGallery extends StatelessWidget {
  const ProjectGallery({required this.items, super.key});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth > 820 ? 3 : 1;
        return GridView.count(
          crossAxisCount: columns,
          crossAxisSpacing: AppSizes.space16,
          mainAxisSpacing: AppSizes.space16,
          childAspectRatio: columns == 1 ? 2.6 : 1.4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: items.map((item) => _GalleryItem(label: item)).toList(),
        );
      },
    );
  }
}

class _GalleryItem extends StatelessWidget {
  const _GalleryItem({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.space20),
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(AppSizes.radius12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.image_outlined, color: AppColors.primary),
          const Spacer(),
          Text(label, style: AppTextStyles.label),
        ],
      ),
    );
  }
}
