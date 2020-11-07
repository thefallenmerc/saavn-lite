import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class APIClient {
  final Dio _dio;
  final bool logging;

  APIClient(this._dio, {this.logging = false}) : assert(logging != null) {
    // add logger
    if (logging) {
      _dio.interceptors.add(LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
      ));
    }
  }

  // get request
  Future<Response<T>> get<T>(String endpoint,
      {Options options, queryParameters}) async {
    try {
      var isConnected = await hasInternetConnection();

      if (!isConnected) {
        throw SocketException("Please check your internet");
      }
      return await _dio.get(endpoint,
          options: options, queryParameters: queryParameters);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  // check for connection
  Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  Map<String, dynamic> getJSONBody<T>(Response<T> response) {
    try {
      var jsonResponse =
          json.decode(response.data as String) as Map<String, dynamic>;
      return jsonResponse;
    } on Exception catch (e, stackTrace) {
      debugPrint(stackTrace.toString());
      throw Exception("Bad body format!");
    }
  }

  List<dynamic> getJSONListBody<T>(Response<T> response) {
    try {
      var jsonResponse = json.decode(response.data as String) as List<dynamic>;
      return jsonResponse;
    } on Exception catch (e, stackTrace) {
      debugPrint(stackTrace.toString());
      throw Exception("Bad body format!");
    }
  }

  Exception _handleError(DioError e) {
    return Exception("Network Error");
  }
}
