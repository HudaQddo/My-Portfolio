import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

@immutable
class PortfolioDecorations extends ThemeExtension<PortfolioDecorations> {
  const PortfolioDecorations({
    required this.panel,
    required this.elevatedPanel,
  });

  final BoxDecoration panel;
  final BoxDecoration elevatedPanel;

  @override
  PortfolioDecorations copyWith({
    BoxDecoration? panel,
    BoxDecoration? elevatedPanel,
  }) {
    return PortfolioDecorations(
      panel: panel ?? this.panel,
      elevatedPanel: elevatedPanel ?? this.elevatedPanel,
    );
  }

  @override
  PortfolioDecorations lerp(
    ThemeExtension<PortfolioDecorations>? other,
    double t,
  ) {
    if (other is! PortfolioDecorations) {
      return this;
    }

    return PortfolioDecorations(
      panel: BoxDecoration.lerp(panel, other.panel, t) ?? panel,
      elevatedPanel:
          BoxDecoration.lerp(elevatedPanel, other.elevatedPanel, t) ??
          elevatedPanel,
    );
  }

  static const dark = PortfolioDecorations(
    panel: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.radius16)),
      border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
    ),
    elevatedPanel: BoxDecoration(
      color: AppColors.surfaceSecondary,
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.radius16)),
      border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadow,
          blurRadius: 30,
          offset: Offset(0, 16),
        ),
      ],
    ),
  );
}

extension PortfolioTheme on BuildContext {
  PortfolioDecorations get portfolioDecorations =>
      Theme.of(this).extension<PortfolioDecorations>()!;
}
