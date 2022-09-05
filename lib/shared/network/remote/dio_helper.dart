import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:football_app/shared/constant/constant.dart';

class DioHelper {

  static Dio ?dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://v3.football.api-sports.io/',
        receiveDataWhenStatusError: true,
      ),
    );
    (dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'X-RapidAPI-Key': api_key,
      'X-RapidAPI-Host': 'v3.football.api-sports.io',
      'Content-Type':'application/json',
    };
    return await dio?.get(
      url,
      queryParameters: query,);
  }
}