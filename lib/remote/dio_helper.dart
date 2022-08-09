import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://3.217.215.70:8081/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {

      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required url,

    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
       };
    return dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
  static Future<Response> postDataLogin({
    required url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    return dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
}