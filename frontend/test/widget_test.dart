import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:frontend/features/projects/presentation/pages/project_details_page.dart';
import 'package:frontend/main.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/core/routing/app_router.dart';

void main() {
  testWidgets('Sakina direct route resolves and returns home', (tester) async {
    AppRouter.router.go('/projects/sakina');
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();
    expect(find.text('Prayer Times Experience'), findsOneWidget);
    expect(find.text('Under Refinement'), findsOneWidget);
    await tester.tap(find.byTooltip('Back to portfolio'));
    await tester.pumpAndSettle();
    expect(find.text('View Projects'), findsOneWidget);
    expect(find.text('Explore Case Study'), findsNWidgets(4));
    expect(find.text('Under Refinement'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('featured case study and next project navigation work', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Explore Case Study').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Explore Case Study').first);
    await tester.pumpAndSettle();
    expect(find.text('Prayer Times Experience'), findsOneWidget);
    for (final heading in [
      'Product Evolution',
      'The Ecosystem',
      'Frontend Ownership',
      'Prayer Times Experience',
    ]) {
      await tester.ensureVisible(find.text('Open'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(find.text(heading), findsOneWidget);
    }
    await tester.tap(find.byTooltip('Back to portfolio'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Explore Case Study').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Explore Case Study').last);
    await tester.pumpAndSettle();
    expect(find.text('Frontend Ownership'), findsOneWidget);
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
    testWidgets('Sakina renders at ${viewport.width}px with larger text', (
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
          home: MediaQuery(
            data: MediaQueryData(
              size: viewport,
              textScaler: TextScaler.linear(1.2),
            ),
            child: const SelectionArea(
              child: ProjectDetailsPage(projectId: 'sakina'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Prayer Times Experience'), findsOneWidget);
      expect(find.text('Adaptive Experience'), findsOneWidget);
      expect(find.text('Under Refinement'), findsOneWidget);
      expect(find.text('Internet required'), findsOneWidget);
      expect(find.text('Project Management'), findsNothing);
      expect(find.text('Production'), findsNothing);
      expect(find.text('Web + Mobile'), findsNothing);
      expect(find.textContaining('technical assessment'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -18000));
      await tester.pumpAndSettle();
      expect(find.text('Next Project').hitTestable(), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Chef Omar case study renders at ${viewport.width}px width', (
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
          home: MediaQuery(
            data: MediaQueryData(
              size: viewport,
              textScaler: TextScaler.linear(1.2),
            ),
            child: const SelectionArea(
              child: ProjectDetailsPage(
                projectId: 'restaurant-ordering-platform',
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Frontend Ownership'), findsOneWidget);
      expect(find.text('Ordering Flow'), findsOneWidget);
      expect(find.text('Two-Developer Collaboration'), findsOneWidget);
      expect(find.text('My implementation'), findsOneWidget);
      expect(find.text('Production'), findsWidgets);
      expect(find.text('Project Management'), findsNothing);
      expect(find.text('AI-Assisted Development'), findsNothing);
      expect(tester.takeException(), isNull);
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -18000));
      await tester.pumpAndSettle();
      expect(find.text('Next Project').hitTestable(), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Dwamiey case study renders at ${viewport.width}px width', (
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
          home: MediaQuery(
            data: MediaQueryData(
              size: viewport,
              textScaler: TextScaler.linear(1.2),
            ),
            child: const SelectionArea(
              child: ProjectDetailsPage(
                projectId: 'enterprise-management-system',
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Product Evolution'), findsOneWidget);
      expect(find.text('Platform Capabilities'), findsOneWidget);
      expect(find.text('Working Beyond My Primary Stack'), findsOneWidget);
      expect(find.text('AI-Assisted Development'), findsOneWidget);
      expect(find.text('Developed entirely by me using Flutter'), findsNothing);
      expect(find.text('The Ecosystem'), findsNothing);
      expect(tester.takeException(), isNull);
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -18000));
      await tester.pumpAndSettle();
      expect(find.text('Next Project').hitTestable(), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

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
