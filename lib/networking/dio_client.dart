import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:qualifacts_case/networking/app_api_exception.dart';

@injectable
class DioClient {
  final Dio _client;

  DioClient(this._client);

  Future<Response> get(
      String url, {
        Map<String, dynamic>? headers,
        CancelToken? cancelToken,
        Map<String, String>? queryParams,
        Duration? connectionTimeout,
        String? language,
      }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException('Internet connection Error');
    }
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }
    return await _client.get(
        url,
        queryParameters: queryParams,
        cancelToken: cancelToken
    );
  }

  Future<Response> post(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? body,
        CancelToken? cancelToken,
        Map<String, String>? queryParams,
        Duration? connectionTimeout,
        String? language,
      }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException('Internet connection Error');
    }
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }
    return await _client.post(
      url,
      data: body,
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  Future<Response> put(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? body,
        CancelToken? cancelToken,
        Map<String, String>? queryParams,
        Duration? connectionTimeout,
        String? language,
      }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException('Internet connection Error');
    }
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }
    return await _client.put(
      url,
      data: body,
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  Future<Response> patch(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? body,
        CancelToken? cancelToken,
        Map<String, String>? queryParams,
        Duration? connectionTimeout,
        String? language,
      }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException('Internet connection Error');
    }
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }
    return await _client.patch(
      url,
      data: body,
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  Future<Response> delete(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? body,
        CancelToken? cancelToken,
        Map<String, String>? queryParams,
        Duration? connectionTimeout,
        String? language,
      }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException('Internet connection Error');
    }
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }
    return await _client.delete(
      url,
      data: body,
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  Future<Response> download(
      String url,
      String savePath, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? body,
        CancelToken? cancelToken,
        Map<String, String>? queryParams,
        Duration? connectionTimeout,
        String? language,
      }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException('Internet connection Error');
    }
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }
    return await _client.download(
      url,
      savePath,
      data: body,
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  Future<Response> upload(
      String url, {
        Map<String, dynamic>? headers,
        String path = '',
        CancelToken? cancelToken,
        Map<String, String>? queryParams,
        Duration? connectionTimeout,
        String? language,
      }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException('Internet connection Error');
    }
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }
    final file = File(path);
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
    });
    return await _client.post(
      url,
      data: formData,
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  Future<Response> fetchRaw({ required RequestOptions requestOptions }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException('Internet connection Error');
    }
    return await _client.fetch(requestOptions);
  }

  Future<bool> _checkInternetConnection({bool test = false}) async {
    if (test) return true;
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.ethernet) || connectivityResult.contains(ConnectivityResult.mobile);
  }
}
