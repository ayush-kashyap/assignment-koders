import 'dart:developer';
import 'package:assignment_koder/utils/storage.dart';
import 'package:dio/dio.dart';
import 'package:dio_curl_logger/dio_curl_logger.dart';

import 'constants.dart';
import 'app_utils.dart';
import 'exception_handler.dart';

class NetworkRequester {
  Dio? _dio;

  NetworkRequester._privateConstructor() {
    prepareRequest();
  }

  static final NetworkRequester shared = NetworkRequester._privateConstructor();


  void prepareRequest({Map<String, dynamic>? headers}) {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: Timeouts.connectTimeout),
      receiveTimeout: const Duration(milliseconds: Timeouts.connectTimeout),
      baseUrl: Constants.baseDomain,
      responseType: ResponseType.json,
      headers: {
        'Accept': Headers.jsonContentType,
        'Content-Type': 'application/json',
        ...?headers
      },
    );
    if (AppUtils.isLoggedIn()) {
      dioOptions.headers['Authorization'] = 'Bearer ${Storage.token}';
    }

    _dio = Dio(dioOptions);

    _dio?.interceptors.clear();

    _dio?.interceptors.addAll([
      CurlLoggingInterceptor(
        showRequestLog:
            true, // Set to false to disable logging of HTTP requests
        showResponseLog:
            false, // Set to false to disable logging of HTTP responses
      ),
      LogInterceptor(
          error: true,
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          logPrint: printLog)
    ]);
  }

  static printLog(Object object) {
    log(object.toString());
  }

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio?.get(path, queryParameters: query);
      if(response?.statusCode==200){
        return response?.data;
      }else{
        throw DioException(requestOptions: RequestOptions(
          data: response?.data
        ));
      }

    } on DioException catch (dioError) {
      ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> getDetails({
    required String path,
    required Options options,
  }) async {
    try {
      final response = await _dio?.get(path, options: options);
      return response?.data;
    } on DioException catch (dioError) {
      ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio?.post(
        path,
        queryParameters: query,
        data: data,
      );
      if(response?.statusCode==200 || response?.statusCode==201){
        return response?.data;
      }else{
        throw DioException(requestOptions: RequestOptions(
            data: response?.data
        ));
      }
    } on DioException catch (dioError) {
      return ExceptionHandler.handleDioError(dioError,isLogin: true);
    } on Exception catch (error) {
      ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> postStatusCode({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {

    final response = await _dio?.post(
      path,
      queryParameters: query,
      data: data,
    );
    return response;
  }

  Future<dynamic> postList({
    required String path,
    Map<String, dynamic>? query,
    List<Map<String, dynamic>>? data,
  }) async {
    try {
      final response =
          await _dio?.post(path, queryParameters: query, data: data);
      return response?.data;
    } on DioException catch (dioError) {
      ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {

      final response =
          await _dio?.put(path, queryParameters: query, data: data);
      if(response?.statusCode==200){
        return response?.data;
      }else{
        throw DioException(requestOptions: RequestOptions(
            data: response?.data
        ));
      }
    } on DioException catch (dioError) {
      ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> postFormData({
    required String path,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    try {
      Dio formDataDio = Dio(BaseOptions(
        connectTimeout: const Duration(milliseconds: Timeouts.connectTimeout),
        receiveTimeout: const Duration(milliseconds: Timeouts.connectTimeout),
        baseUrl: Constants.baseDomain,
        responseType: ResponseType.json,
        headers: {
          'Accept': Headers.jsonContentType,
          // Don't set Content-Type here - let Dio handle it automatically for FormData
        },
      ));

      // Add authorization header
      if (AppUtils.isLoggedIn()) {
        formDataDio.options.headers['Authorization'] =
            'Bearer ${Storage.token}';
      }

      final response = await formDataDio.post(
        path,
        queryParameters: query,
        data: data,
      );
      return response.data;
    } on DioException catch (dioError) {
      ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      ExceptionHandler.handleError(error);
    }
  }
}
