import 'package:flutter/widgets.dart';

import '../constants/app_sizes.dart';

abstract final class ScrollHelper {
  static Future<void> scrollTo(GlobalKey key) async {
    final context = key.currentContext;
    if (context == null) {
      return;
    }

    await Scrollable.ensureVisible(
      context,
      duration: AppSizes.animationMedium,
      curve: Curves.easeOutCubic,
      alignment: 0.02,
    );
  }
}
