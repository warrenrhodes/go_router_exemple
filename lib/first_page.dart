import 'package:flutter/material.dart';
import 'package:go_router_exemple/routes/app_router.dart';
import 'package:go_router_exemple/routes/pages_routes.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          child: Center(
            child: FilledButton(
              onPressed: () => AppRouter.push(
                context,
                PagesRoutes.secondPage.pattern,
              ),
              child: const Text('Push to second Page'),
            ),
          ),
        ),
      ),
    );
  }
}
