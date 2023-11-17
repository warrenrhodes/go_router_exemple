import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_exemple/first_page.dart';
import 'package:go_router_exemple/second_page.dart';
import 'package:go_router_exemple/third_page.dart';

import 'app_router.dart';
import 'pages_routes.dart';

/// The routes representation.
class GoRouterRoutesProvider {
  /// The routes provider.
  static final GoRouter routes = GoRouter(
    initialLocation: PagesRoutes.firstPage.pattern,
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, __) =>
            context.namedLocation(PagesRoutes.firstPage.pattern),
      ),
      GoRoute(
        path: PagesRoutes.firstPage.pattern,
        builder: (context, state) {
          return const FirstPage();
        },
      ),
      GoRoute(
        path: PagesRoutes.secondPage.pattern,
        builder: (context, state) {
          return const SecondPage();
        },
      ),
      GoRoute(
        path: PagesRoutes.thirdPage.pattern,
        builder: (context, state) {
          return const ThirdPage();
        },
      ),
    ],
  );

  static Future<void> init() => Future.value();
}

/// AppROuter implementation using GoRouter.
class AppRouterGoRouter extends AppRouterSubsystem {
  @override
  Future<void> init() {
    return GoRouterRoutesProvider.init();
  }

  @override
  void push(BuildContext context, String uri, {Object? extra}) {
    context.push(uri, extra: extra);
  }

  @override
  void pushReplacement(BuildContext context, String uri, {Object? extra}) {
    context.pushReplacement(uri, extra: extra);
  }

  @override
  void go(BuildContext context, String uri, {Object? extra}) {
    context.go(uri, extra: extra);
  }

  @override
  void pushReplacementNamed(
    BuildContext context,
    String uri, {
    Object? extra,
  }) {
    context.go(uri, extra: extra);
  }

  @override
  String getCurrentLocation(BuildContext context) {
    return GoRouterState.of(context).uri.path;
  }

  @override
  void updateRouteInformation(BuildContext context, String uri) {}

  @override
  bool canPop(BuildContext context) {
    return GoRouter.of(context).canPop();
  }

  @override
  void onPop(BuildContext context) {
    GoRouter.of(context).pop();
  }

  @override
  RouterConfig<Object>? get routerConfig => GoRouterRoutesProvider.routes;

  @override
  BackButtonDispatcher? get backButtonDispatcher =>
      GoRouterRoutesProvider.routes.backButtonDispatcher;

  @override
  RouteInformationParser<Object>? get routeInformationParser =>
      GoRouterRoutesProvider.routes.routeInformationParser;

  @override
  RouterDelegate<Object>? get routerDelegate =>
      GoRouterRoutesProvider.routes.routerDelegate;

  @override
  RouteInformationProvider? get routeInformationProvider =>
      GoRouterRoutesProvider.routes.routeInformationProvider;
}
