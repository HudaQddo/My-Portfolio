import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/widgets/tech_chip.dart';

class ProjectTechnologyList extends StatelessWidget {
  const ProjectTechnologyList({required this.technologies, super.key});

  final List<String> technologies;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSizes.space8,
      runSpacing: AppSizes.space8,
      children: technologies
          .map((technology) => TechChip(label: technology))
          .toList(),
    );
  }
}
