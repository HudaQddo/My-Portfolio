import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/projects/presentation/pages/project_details_page.dart';
import 'route_names.dart';

abstract final class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: RouteNames.home,
        builder: (context, state) => const SelectionArea(child: HomePage()),
      ),
      GoRoute(
        path: '/projects/:id',
        name: RouteNames.projectDetails,
        builder: (context, state) {
          final projectId = state.pathParameters['id'] ?? '';
          return SelectionArea(
            child: ProjectDetailsPage(projectId: projectId),
          );
        },
      ),
    ],
  );
}
