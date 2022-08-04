import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'service_helpers.dart';

/// this main service will provide the management of http request using some package

class ServiceHttp {
  Future<Map<String, dynamic>> jsonGetRequestHttp(
      {required String url,
      Map<String, String> parameters = const {},
      Map<String, dynamic> headers = const {}}) async {
    Map<String, dynamic> tmpMap = {};
    final dio = Dio();
    try {
      /// BlocCentral is singleton class we wouldn't a new instance Here
      if (ServiceHelpers.validateUrl(url)) {
        final response = await dio.get(url,
            queryParameters: parameters, options: Options(headers: headers));
        if (response.data.runtimeType == String) {
          tmpMap = jsonDecode(response.data);
        } else if (response.data is Map<String, dynamic>) {
          tmpMap = response.data;
        }
      }
    } on DioError catch (e) {
      _handleDioError(e);
    }
    return tmpMap;
  }

  Future<List<Map<String, dynamic>>> listGetRequestHttp(
      {required String url,
      Map<String, String> parameters = const {},
      Map<String, dynamic> headers = const {}}) async {
    List<Map<String, dynamic>> tmp = [];
    final dio = Dio();
    try {
      if (ServiceHelpers.validateUrl(url)) {
        final response = await dio.get(url,
            queryParameters: parameters, options: Options(headers: headers));
        if (response.data is List<dynamic>) {
          for (final tmp2 in response.data) {
            try {
              tmp.add(tmp2 as Map<String, dynamic>);
            } catch (e) {
// manage this erro with elegancy some day
            }
          }
        }
      }
    } on DioError catch (e) {
      _handleDioError(e);
    }
    return tmp;
  }

  Future<Map<String, dynamic>> jsonPostRequestHttp(
      {required String url,
      Map<String, dynamic> parameters = const {},
      Map<String, dynamic>? body,
      Map<String, dynamic> headers = const {}}) async {
    Map<String, dynamic> tmpMap = {};
    final dio = Dio();
    try {
      if (ServiceHelpers.validateUrl(url)) {
        final response = await dio.post(url,
            queryParameters: parameters,
            data: body,
            options: Options(headers: headers));
        if (response.data.runtimeType == String) {
          tmpMap = jsonDecode(response.data);
        }
        if (response.data is Map<String, dynamic>) {
          tmpMap = response.data;
        }
      }
    } on DioError catch (e) {
      _handleDioError(e);
    }
    return tmpMap;
  }
}

Exception _handleDioError(DioError e) {
  if (e.type == DioErrorType.connectTimeout ||
      e.type == DioErrorType.receiveTimeout ||
      e.type == DioErrorType.sendTimeout) {
    throw TimeoutException("request timeout");
  }
  if (e.type == DioErrorType.other && e.message.contains("SocketException")) {
    throw const SocketException("Unable to connecto to service");
  }
  throw e;
}
