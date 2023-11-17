import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_router.dart';
import 'app_router_gorouter.dart';
import 'app_router_single_stack.dart';

/// AppRouter implementation using GoRouter and SingleStack navigator.
class AppRouterHybrid extends AppRouterSubsystem {
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

  @override
  Future<void> init() {
    return GoRouterRoutesProvider.init();
  }

  @override
  void push(BuildContext context, String uri, {Object? extra}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SingleStackNavigator(
          uri,
          extraArguments: extra,
        ),
      ),
    );

    AppRouter.updateRouteInformation(
      context,
      uri,
    );
  }

  @override
  void pushReplacement(BuildContext context, String uri, {Object? extra}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SingleStackNavigator(
          uri,
          extraArguments: extra,
        ),
      ),
    );
  }

  @override
  void go(BuildContext context, String uri, {Object? extra}) {
    GoRouter.of(context).go(uri, extra: extra);
  }

  @override
  void pushReplacementNamed(
    BuildContext context,
    String uri, {
    Object? extra,
  }) {
    context.pushReplacementNamed(uri, extra: extra);
  }

  @override
  String getCurrentLocation(BuildContext context) {
    return GoRouterState.of(context).matchedLocation;
  }

  @override
  void updateRouteInformation(
    BuildContext context,
    String uri, {
    Object? extra,
  }) {
    return;
  }

  @override
  bool canPop(BuildContext context) {
    return GoRouter.of(context).canPop();
  }

  @override
  void onPop(BuildContext context) {
    GoRouter.of(context).pop();
  }
}
