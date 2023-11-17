/// The pages routes.
abstract class PagesRoutes {
  static final firstPage = _PageOneRoute();
  static final secondPage = _PageTwoRoute();
  static final thirdPage = _PageThreeRoute();
}

/// Interface for routes with parameters.
abstract class PagesRoutesWithParams<T> {
  /// Returns the pattern URL associated with the route.
  String get pattern;

  /// Creates the route URL.
  String create(T parameters);
}

/// Interface for routes without parameters.
abstract class PagesRoutesNoParams {
  /// Returns the pattern URL associated with the route.
  String get pattern;

  /// Creates the route URL.
  String create() => pattern;
}

class _PageOneRoute extends PagesRoutesNoParams {
  @override
  String get pattern => '/page_1';
}

class _PageTwoRoute extends PagesRoutesNoParams {
  @override
  String get pattern => '/page_2';
}

class _PageThreeRoute extends PagesRoutesNoParams {
  @override
  String get pattern => '/page_3';
}
