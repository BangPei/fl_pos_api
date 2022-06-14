import 'package:dio/dio.dart';
import 'package:fl_pos_app/api/interceptors/dio_interceptors.dart';
import 'package:fl_pos_app/api/restclient.dart';

class Api {
  static final dio = Dio();

  static const baseUrl = "https://localhost:7073/";

  static restClient() async {
    final dio = Dio();
    dio.interceptors.clear();
    dio.interceptors.add(DioInterceptors(dio));
    return RestClient(dio, baseUrl: baseUrl);
  }
}
