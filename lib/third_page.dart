import 'package:flutter/material.dart';

import 'routes/app_router.dart';
import 'routes/pages_routes.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          child: Center(
            child: FilledButton(
              onPressed: () => AppRouter.go(
                context,
                PagesRoutes.firstPage.pattern,
              ),
              child: const Text('Got to first Page'),
            ),
          ),
        ),
      ),
    );
  }
}
