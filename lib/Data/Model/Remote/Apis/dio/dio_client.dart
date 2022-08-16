import 'dart:io';


import 'package:dio/dio.dart';
import 'package:employeenetwork/utill/app_constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'logging_interceptor.dart';

class DioClient {
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;
  final SharedPreferences sharedPreferences;

  late Dio dio;
  String? token="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZmYwYWUwNjFkNDMxOWM4NmE1NGRkM2YwNTgxMjA0ODdjNWVlMmYyYjMzZjQzY2I5ODBlYTAzMGRhMzA4YmZhNmYyMDRhZGMyYzBjNTU1NmUiLCJpYXQiOjE2NjA1NDkxNjguNjU2NTkxLCJuYmYiOjE2NjA1NDkxNjguNjU2NTk1LCJleHAiOjE2OTIwODUxNjguNjQ4OTU3LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.dcrBfxPO9wGCWn3MvGaoszN29jhl09O9AO9Pq0ZRgWuAhAcpnkZSv-rl-1ARCpS1HocoP8F8XD-4_Dhl3UaAn6Yoousjk7WT5EsT04qHrjGk8nB1ldQzfn1mUt6I2vSBG3Ef53-utiFfJXVotuwhPxwsl0787KjYfV_WZFZtryEjfRrfnwWqbl7cNpNH10mWGEHQjatGMXUZj21y8tAGbjycQJFq3s4imfAYPEGj8FWPPtNBiFil4My4LUlH8KukMqfTiduo9-ARXvS5LI69kmN1ZSN0emK6JCj3X7ma_UNWqqD_gPNg1fdJTylq9Jas-IF2dgjfs7RgNhIPhQVqQzzY-5kFw67v_8M6npaqoUzAbc_d5yTY4oX1r_gBVX6-2gK1IhjvQ9kddKYPqgvHX0uC3ty9NPJto0t_J8yqVseAHRtFx5kH4FrjPQdKaVncAOPuQbqm9AvaYShx9xBSttQwTO0lftdhDZy8bmUP2YI8mr1bXV6flLFoFb8gYvJhnJrJkDm1Wzm8ReAHQLhfebOnpjD-Fsmg9WxpHbCbw5u71zaLbuDKn2_0vBjSUSQ1hjI_K8PbCbOI9Gzpa47JiZHKBXajyFaKvvrlh4gTx1KgXmOU3Jd7QyoNaG2-FtVNG_tLCqATjJJYLLOYuJiLy9P2WiUUEaoIShAlC5QHTkI";

  DioClient(
    this.baseUrl,
    Dio dioC, {
    required this.loggingInterceptor,
    required this.sharedPreferences,
  }) {
    // token = sharedPreferences.getString(AppConstants.TOKEN);
    print("NNNN $token");
    dio = dioC != null ? dioC : Dio();
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 50000
      ..options.receiveTimeout = 50000
      ..httpClientAdapter
      ..options.headers = <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }
      ..options.contentType = 'application/json';
    dio.interceptors.add(loggingInterceptor);
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      token = (await sharedPreferences.getString(AppConstants.TOKEN));

      // options!.contentType = 'application/json';

      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          contentType: 'application/json',
          receiveTimeout: 50000,
          sendTimeout: 50000,
        ),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }
}
