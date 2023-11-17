import 'package:flutter/material.dart';
import 'package:go_router_exemple/routes/pages_routes.dart';

import 'routes/app_router.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          child: Center(
            child: FilledButton(
              onPressed: () => AppRouter.push(
                context,
                PagesRoutes.thirdPage.pattern,
              ),
              child: const Text('Push to third Page'),
            ),
          ),
        ),
      ),
    );
  }
}
