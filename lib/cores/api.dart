// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amruta_ayurveda/presentation/screens/splash%20screen/splash_screen.dart';
import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final Map<String, dynamic> DEFAULT_HEADERS = {
  "Content-Type": "application/json"
};

class Api {
  final Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = 'https://flutter-amr.noviindus.in/api/';
    _dio.options.headers = DEFAULT_HEADERS;

    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }

  void setAuthorizationToken() {
    String? AUTH_TOKEN = pref.getString('token');
    _dio.options.headers["Authorization"] = "Bearer $AUTH_TOKEN";
  }

  Future<Response> sendRequest(
    String path, {
    String method = "GET",
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool authorization = false,
  }) async {
    if (authorization) {
      setAuthorizationToken();
    }
    FormData? formData;
    if (data != null) {
      formData = FormData.fromMap(data);
    }
    try {
      return await _dio.request(
        path,
        data: formData,
        queryParameters: queryParameters,
        options: Options(method: method),
      );
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          throw ApiException(
              "Backend not reachable. \nPlease check your internet connection.");
        } else if (e.type == DioExceptionType.connectionError) {
          throw ApiException(
              "You are not connected! \nPlease check your internet connection.");
        } else {
          throw ApiException(
              "Unexpected error occurred. \nPlease try again later.");
        }
      } else {
        throw ApiException(
            "Unexpected error occurred. \nPlease try again later.");
      }
    }
  }
}

class ApiResponse {
  bool success;
  dynamic data;
  String? message;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
  });

  factory ApiResponse.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return ApiResponse(
        success: data['status'],
        data: data['data'],
        message: data['message'] ?? 'Unexpected error');
  }
}

class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  @override
  String toString() => message;
}
