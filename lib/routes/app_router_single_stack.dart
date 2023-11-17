import 'package:flutter/material.dart';
import 'package:go_router_exemple/routes/app_router.dart';
import 'package:go_router_exemple/third_page.dart';

import '../first_page.dart';
import '../second_page.dart';

/// Navigator that keeps a single stack of page (Navigator 1.0).
class SingleStackNavigator extends StatelessWidget {
  /// The url path.
  final String url;

  /// The extra argument passed to url.
  final Object? extraArguments;

  /// Constructs a new [SingleStackNavigator].
  const SingleStackNavigator(this.url, {super.key, this.extraArguments});

  @override
  Widget build(BuildContext context) {
    final parsedUri = Uri.parse(url);
    final segments = parsedUri.pathSegments;

    if (segments.first == 'page_1') {
      return const FirstPage();
    }
    if (segments.first == 'page_2') {
      return const SecondPage();
    }
    if (segments.first == 'page_3') {
      return const ThirdPage();
    }

    return const SizedBox();
  }
}

/// AppRouter implementation using a SingleStackNavigator.
class AppRouterSingleStack extends AppRouterSubsystem {
  @override
  Future<void> init() async {}

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
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => SingleStackNavigator(
          uri,
          extraArguments: extra,
        ),
      ),
      (_) => false,
    );
  }

  @override
  void pushReplacementNamed(
    BuildContext context,
    String uri, {
    Object? extra,
  }) {
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
  String getCurrentLocation(BuildContext context) {
    return '';
  }

  @override
  void updateRouteInformation(BuildContext context, String uri) {}

  @override
  bool canPop(BuildContext context) {
    return Navigator.of(context).canPop();
  }

  @override
  void onPop(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  RouterConfig<Object>? get routerConfig => null;

  @override
  BackButtonDispatcher? get backButtonDispatcher => null;

  @override
  RouteInformationParser<Object>? get routeInformationParser => null;

  @override
  RouterDelegate<Object>? get routerDelegate => null;

  @override
  RouteInformationProvider? get routeInformationProvider => null;
}
