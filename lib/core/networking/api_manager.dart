import 'package:dio/dio.dart';
import 'package:doctor_app/core/networking/api_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final dio = Dio();

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      ApiConstants.apiBaseUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
    Object? body,
  }) {
    return dio.post(
      ApiConstants.apiBaseUrl + endPoint,
      queryParameters: queryParameters,
      data: body,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }
}
