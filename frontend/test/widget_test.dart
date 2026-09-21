import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:frontend/features/projects/presentation/pages/project_details_page.dart';
import 'package:frontend/main.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/core/routing/app_router.dart';

void main() {
  testWidgets('featured case study and next project navigation work', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Explore Case Study'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Explore Case Study'));
    await tester.pumpAndSettle();
    expect(find.text('The Ecosystem'), findsOneWidget);
    await tester.ensureVisible(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.text('Enterprise Management System'), findsWidgets);
    expect(find.text('Technology Stack'), findsOneWidget);
    expect(tester.takeException(), isNull);
    AppRouter.router.go('/');
    await tester.pumpAndSettle();
  });

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

  for (final viewport in [const Size(320, 740), ...viewports]) {
    testWidgets('Midadd case study renders at ${viewport.width}px width', (
      tester,
    ) async {
      tester.view
        ..physicalSize = viewport
        ..devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.dark,
          home: const SelectionArea(
            child: ProjectDetailsPage(
              projectId: 'educational-management-system',
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Case Study'), findsOneWidget);
      expect(find.text('Midadd'), findsWidgets);
      expect(find.text('The Ecosystem'), findsOneWidget);
      expect(find.text('Project Management'), findsOneWidget);
      expect(find.text('Administration Application'), findsOneWidget);
      expect(
        find.text('Developed entirely by me using Flutter'),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -12000));
      await tester.pumpAndSettle();
      expect(find.text('Next Project').hitTestable(), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
