import 'package:dio/dio.dart';
import 'package:fl_pos_app/api/common.dart';
import 'package:fl_pos_app/router/app_router.dart';
import 'package:fl_pos_app/router/app_routers.dart';
import 'package:flutter/material.dart';

import 'injector.dart';
import 'navigation_service.dart';

class DioInterceptors extends InterceptorsWrapper {
  final Dio dio;
  DioInterceptors(this.dio);
  final NavigationService _nav = locator<NavigationService>();

  @override
  Future onError(err, handler) async {
    int? responseCode = err.response?.statusCode;
    if (responseCode != null) {
      if (responseCode == 403) {
        AppRouter.router.navigateTo(
          _nav.navigatorKey.currentContext!,
          NavigateTo.homeRoute.route,
          replace: true,
          clearStack: true,
        );
      } else {
        Common.modalInfo(
          _nav.navigatorKey.currentContext!,
          title: "Error",
          message: err.response?.data['message'] ?? "Gagal Mengakses Server",
          icon: const Icon(
            Icons.cancel_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      }
    } else {
      Common.modalInfo(
        _nav.navigatorKey.currentContext!,
        title: "Error",
        message: err.response?.data['message'] ?? "Gagal Mengakses Server",
        icon: const Icon(
          Icons.cancel_outlined,
          color: Colors.red,
          size: 40,
        ),
      );
    }
    super.onError(err, handler);
  }
}
