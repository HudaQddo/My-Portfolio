import 'package:flutter/widgets.dart';

import '../constants/app_breakpoints.dart';
import '../constants/app_sizes.dart';

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  bool get isMobile => screenWidth < AppBreakpoints.mobile;
  bool get isTablet =>
      screenWidth >= AppBreakpoints.mobile &&
      screenWidth <= AppBreakpoints.desktop;
  bool get isDesktop => screenWidth > AppBreakpoints.desktop;

  EdgeInsets get pagePadding {
    if (isMobile) {
      return const EdgeInsets.symmetric(horizontal: AppSizes.space20);
    }
    if (isTablet) {
      return const EdgeInsets.symmetric(horizontal: AppSizes.space32);
    }
    return const EdgeInsets.symmetric(horizontal: AppSizes.space48);
  }

  double get sectionSpacing => isMobile ? AppSizes.space64 : AppSizes.space96;
}
