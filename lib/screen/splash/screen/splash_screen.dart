import 'package:fl_pos_app/router/app_router.dart';
import 'package:fl_pos_app/router/app_routers.dart';
import 'package:fl_pos_app/widget/loading_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        AppRouter.router.navigateTo(
          context,
          NavigateTo.homeRoute.route,
          replace: true,
          clearStack: true,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingScreen(title: "Harap Tunggu ..."),
    );
  }
}
