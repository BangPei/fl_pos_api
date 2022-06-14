import 'package:fl_pos_app/router/app_router.dart';
import 'package:fl_pos_app/router/app_routers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class RouteNotFoundPage extends StatelessWidget {
  const RouteNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Route not found"),
            TextButton(
              onPressed: () => AppRouter.router.navigateTo(
                context,
                NavigateTo.homeRoute.route,
                replace: true,
                clearStack: true,
                transition: TransitionType.none,
              ),
              child: const Text("Go Home"),
            )
          ],
        ),
      ),
    );
  }
}
