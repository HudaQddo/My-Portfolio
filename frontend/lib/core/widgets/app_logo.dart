import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_assets.dart';
import '../constants/app_sizes.dart';
import '../constants/app_strings.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({this.size = AppSizes.space48, super.key});

  final double size;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(AppSizes.radius12),
    child: SvgPicture.asset(
      AppAssets.logo,
      width: size,
      height: size,
      fit: BoxFit.contain,
      semanticsLabel: '${AppStrings.name} logo',
    ),
  );
}
