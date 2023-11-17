import 'package:flutter/material.dart';

import 'routes/app_router.dart';

Future<void> main() async {
  await AppRouter.init(AppRouterType.hybrid);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.getRouterConfig(),
      // routerDelegate: AppRouter.getRouterDelegate(),
      // routeInformationParser: AppRouter.getRouteInformationParser(),
      // backButtonDispatcher: AppRouter.getBackButtonDispatcher(),
      // routeInformationProvider: AppRouter.getRouteInformationProvider(),
      theme: ThemeData(
        primarySwatch: Colors.blue,

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller
        // and closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,

        // Default font to use around the app.
      ),
    );
  }
}
