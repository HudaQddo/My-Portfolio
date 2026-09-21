import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

abstract final class AppTextStyles {
  static const displayLarge = TextStyle(
    fontSize: 68,
    height: 0.98,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: AppColors.cream,
  );

  static const displayMedium = TextStyle(
    fontSize: 46,
    height: 1.08,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: AppColors.cream,
  );

  static const headingLarge = TextStyle(
    fontSize: 34,
    height: 1.15,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: AppColors.cream,
  );

  static const headingMedium = TextStyle(
    fontSize: 24,
    height: 1.25,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.cream,
  );

  static const bodyLarge = TextStyle(
    fontSize: 18,
    height: 1.65,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: AppColors.beige,
  );

  static const bodyMedium = TextStyle(
    fontSize: 15,
    height: 1.55,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: AppColors.mutedText,
  );

  static const label = TextStyle(
    fontSize: 13,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: AppColors.primary,
  );
}
