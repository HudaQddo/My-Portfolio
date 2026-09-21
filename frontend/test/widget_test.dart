import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:frontend/features/projects/presentation/pages/project_details_page.dart';
import 'package:frontend/main.dart';
import 'package:frontend/core/theme/app_theme.dart';

void main() {
  final viewports = <Size>[
    const Size(390, 844),
    const Size(820, 1180),
    const Size(1440, 1000),
  ];

  for (final viewport in viewports) {
    testWidgets('portfolio renders at ${viewport.width}px width', (
      tester,
    ) async {
      tester.view
        ..physicalSize = viewport
        ..devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const PortfolioApp());
      await tester.pumpAndSettle();

      expect(find.text('HUDA QDDO'), findsOneWidget);
      expect(find.text('View Projects'), findsOneWidget);
    });
  }

  testWidgets('project details page loads from project id', (tester) async {
    tester.view
      ..physicalSize = const Size(1200, 900)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark,
        home: ProjectDetailsPage(projectId: 'educational-management-system'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Case Study'), findsOneWidget);
    expect(find.text('Educational Management System'), findsWidgets);
    expect(find.text('Technology Stack'), findsOneWidget);
  });
}
