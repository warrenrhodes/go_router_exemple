import 'package:flutter/material.dart';

import 'app_router_gorouter.dart';
import 'app_router_hybrid.dart';
import 'app_router_single_stack.dart';

/// The supported routing types.
enum AppRouterType {
  /// GoRouter as routing subsystem.
  gorouter,

  /// Single-stack navigator (Navigator 1.0).
  singleStack,

  /// Hybrid of Beamer and Single-stack navigator.
  /// Beamer handles the deeplinking.
  /// Single-stack handles the internal navigation.
  hybrid,
}

/// Interface for our routing subsystems.
abstract class AppRouterSubsystem {
  /// Returns the router config.
  RouterConfig<Object>? get routerConfig;

  /// Returns the route delegate.
  RouterDelegate<Object>? get routerDelegate;

  /// Returns the route information parser.
  RouteInformationParser<Object>? get routeInformationParser;

  /// Returns the route information parser.
  RouteInformationProvider? get routeInformationProvider;

  /// Returns the back button dispatcher.
  BackButtonDispatcher? get backButtonDispatcher;

  /// Initializes the routing subsystem.
  Future<void> init();

  /// Adds a route to the navigator stack.
  void push(BuildContext context, String uri, {Object? extra});

  /// Replaces the top route on the navigator stack.
  void pushReplacement(BuildContext context, String uri, {Object? extra});

  /// Replaces the navigator stack with the specified route.
  void go(BuildContext context, String uri, {Object? extra});

  /// Adds a route to the navigator stack.
  void pushReplacementNamed(
    BuildContext context,
    String uri, {
    Object? extra,
  });

  /// Returns the current routing location.
  String getCurrentLocation(BuildContext context);

  /// Updates the routing information (displayed in the browser url bar).
  void updateRouteInformation(BuildContext context, String uri);

  /// Checks if the current route can be popped.
  bool canPop(BuildContext context);

  /// Removes the current route.
  void onPop(BuildContext context);
}

/// Navigation system which the subsytem specified on init().
class AppRouter {
  static AppRouterSubsystem subsystem = AppRouterHybrid();

  static Future<void> init(AppRouterType type) {
    switch (type) {
      case AppRouterType.gorouter:
        subsystem = AppRouterGoRouter();
        break;
      case AppRouterType.singleStack:
        subsystem = AppRouterSingleStack();
        break;
      case AppRouterType.hybrid:
        subsystem = AppRouterHybrid();
        break;
    }

    return subsystem.init();
  }

  /// Adds a route to the navigator stack.
  static void push(BuildContext context, String uri, {Object? extra}) {
    return subsystem.push(context, uri, extra: extra);
  }

  /// Replaces the top route on the navigator stack.
  static void pushReplacement(
    BuildContext context,
    String uri, {
    Object? extra,
  }) {
    return subsystem.pushReplacement(context, uri, extra: extra);
  }

  /// Replaces the navigator stack with the specified route.
  static void go(BuildContext context, String uri, {Object? extra}) {
    return subsystem.go(context, uri, extra: extra);
  }

  /// Adds a route to the navigator stack.
  static void pushReplacementNamed(
    BuildContext context,
    String uri, {
    Object? extra,
  }) {
    return subsystem.pushReplacementNamed(context, uri, extra: extra);
  }

  /// Returns the current routing location.
  static String getCurrentLocation(BuildContext context) {
    return subsystem.getCurrentLocation(context);
  }

  /// Updates the routing information (displayed in the browser url bar).
  static void updateRouteInformation(
    BuildContext context,
    String uri, {
    Object? extra,
  }) {
    return subsystem.updateRouteInformation(context, uri);
  }

  /// Checks if the current route can be popped.
  static bool canPop(BuildContext context) {
    return subsystem.canPop(context);
  }

  /// Removes the current route.
  static void onPop(BuildContext context) {
    return subsystem.onPop(context);
  }

  /// Returns the router config.
  static RouterConfig<Object>? getRouterConfig() {
    return subsystem.routerConfig;
  }

  /// Returns the route delegate.
  static RouterDelegate<Object>? getRouterDelegate() {
    return subsystem.routerDelegate;
  }

  /// Returns the route information parser.
  static RouteInformationParser<Object>? getRouteInformationParser() {
    return subsystem.routeInformationParser;
  }

  /// Returns the back button dispatcher.
  static BackButtonDispatcher? getBackButtonDispatcher() {
    return subsystem.backButtonDispatcher;
  }

  /// Returns the route information provider.
  static RouteInformationProvider? getRouteInformationProvider() {
    return subsystem.routeInformationProvider;
  }
}
