import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/responsive/responsive_extensions.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_icon_button.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../pages/home_page.dart';

class AppNavbarDelegate extends SliverPersistentHeaderDelegate {
  const AppNavbarDelegate({
    required this.isScrolled,
    required this.onSectionSelected,
    required this.onMenuPressed,
    required this.onDownloadCv,
  });

  final bool isScrolled;
  final ValueChanged<HomeSectionId> onSectionSelected;
  final VoidCallback onMenuPressed;
  final VoidCallback onDownloadCv;

  @override
  double get minExtent => AppSizes.navbarHeight;

  @override
  double get maxExtent => AppSizes.navbarHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return AppNavbar(
      isScrolled: isScrolled || overlapsContent,
      onSectionSelected: onSectionSelected,
      onMenuPressed: onMenuPressed,
      onDownloadCv: onDownloadCv,
    );
  }

  @override
  bool shouldRebuild(AppNavbarDelegate oldDelegate) {
    return isScrolled != oldDelegate.isScrolled;
  }
}

class AppNavbar extends StatelessWidget {
  const AppNavbar({
    required this.isScrolled,
    required this.onSectionSelected,
    required this.onMenuPressed,
    required this.onDownloadCv,
    super.key,
  });

  final bool isScrolled;
  final ValueChanged<HomeSectionId> onSectionSelected;
  final VoidCallback onMenuPressed;
  final VoidCallback onDownloadCv;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppSizes.animationMedium,
      color: AppColors.deepDark.withValues(alpha: isScrolled ? 0.94 : 0.78),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
          child: Padding(
            padding: context.pagePadding,
            child: Row(
              children: [
                const _Logo(),
                const Spacer(),
                if (!context.isDesktop)
                  AppIconButton(
                    icon: Icons.menu_rounded,
                    tooltip: 'Open navigation menu',
                    onPressed: onMenuPressed,
                  )
                else ...[
                  _NavLinks(onSectionSelected: onSectionSelected),
                  const SizedBox(width: AppSizes.space24),
                  PrimaryButton(
                    label: 'Download CV',
                    icon: Icons.download_rounded,
                    semanticLabel: 'Download Huda Qddo CV',
                    onPressed: onDownloadCv,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppNavDrawer extends StatelessWidget {
  const AppNavDrawer({
    required this.onSectionSelected,
    required this.onDownloadCv,
    super.key,
  });

  final ValueChanged<HomeSectionId> onSectionSelected;
  final VoidCallback onDownloadCv;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.deepDark,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.space24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Logo(),
              const SizedBox(height: AppSizes.space32),
              _NavLinks(
                onSectionSelected: onSectionSelected,
                axis: Axis.vertical,
              ),
              const Spacer(),
              PrimaryButton(
                label: 'Download CV',
                icon: Icons.download_rounded,
                onPressed: onDownloadCv,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 42,
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(AppSizes.radius12),
          ),
          child: Text(AppStrings.initials, style: AppTextStyles.label),
        ),
        const SizedBox(width: AppSizes.space12),
        Text(AppStrings.name, style: AppTextStyles.label),
      ],
    );
  }
}

class _NavLinks extends StatelessWidget {
  const _NavLinks({
    required this.onSectionSelected,
    this.axis = Axis.horizontal,
  });

  final ValueChanged<HomeSectionId> onSectionSelected;
  final Axis axis;

  static const _links = [
    (label: 'Home', section: HomeSectionId.home),
    (label: 'About', section: HomeSectionId.about),
    (label: 'Projects', section: HomeSectionId.projects),
    (label: 'Experience', section: HomeSectionId.experience),
    (label: 'Skills', section: HomeSectionId.skills),
    (label: 'Contact', section: HomeSectionId.contact),
  ];

  @override
  Widget build(BuildContext context) {
    final children = _links
        .map(
          (link) => _NavLink(
            label: link.label,
            onTap: () => onSectionSelected(link.section),
          ),
        )
        .toList();

    if (axis == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    }
    return Row(children: children);
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes.radius8),
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.space12,
            vertical: AppSizes.space12,
          ),
          child: AnimatedDefaultTextStyle(
            duration: AppSizes.animationMedium,
            style: AppTextStyles.label.copyWith(
              color: _isHovered ? AppColors.cream : AppColors.mutedText,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
