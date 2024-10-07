import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_gorouter/common/extensions/navigator.dart';
import 'package:study_gorouter/presentation/page_a/page_a.dart';
import 'package:study_gorouter/presentation/page_detail/detail.dart';
import 'package:study_gorouter/presentation/page_detail/detail_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>();
final _shellNavigatorBKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
    initialLocation: '/a',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigatorShell) {
            return ScaffoldWithNestedNavigation(
              navigationShell: navigatorShell,
            );
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorAKey,
              routes: [
                GoRoute(
                    path: '/a',
                    pageBuilder: (context, state) => const NoTransitionPage(
                        child:
                            RootScreen(label: 'A', detailsPath: '/a/details')),
                    routes: [
                      GoRoute(
                        path: "details",
                        builder: (context, state) =>
                            const DetailsScreen(label: 'A'),
                      )
                    ]),
              ],
            ),
            StatefulShellBranch(navigatorKey: _shellNavigatorBKey, routes: [
              GoRoute(
                  path: '/b',
                  pageBuilder: (context, state) => const NoTransitionPage(
                      child: RootScreen(label: 'B', detailsPath: '/b/details')),
                  routes: [
                    GoRoute(
                      path: "details",
                      builder: (context, state) =>
                          const DetailsScreen(label: 'B'),
                    )
                  ])
            ])
          ]),
    ]);
