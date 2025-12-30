import 'package:assignment_koder/utils/app_utils.dart';
import 'package:assignment_koder/widgets/toast.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'constants.dart';

class APIExceptionString implements Exception {
  dynamic detail;

  APIExceptionString({this.detail});

  APIExceptionString.fromJson(dynamic json) {
    detail = json;
  }

  Map<String, dynamic> toJson() {
    final dynamic data ;
    data= detail;
    return data;
  }
}

class ExceptionHandler {
  static handleDioError(DioException error,{isLogin=false}) {
    switch (error.type) {
      case DioExceptionType.unknown:
        showErrorToast(ErrorMessages.noInternet);
        break;
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        showErrorToast(ErrorMessages.connectionTimeout);
        break;
      case DioExceptionType.badResponse:
        if (error.response != null && error.response?.data != null) {
          try {
            var apiException =
                APIExceptionString.fromJson(error.response?.data);
            if (apiException.detail.runtimeType == List<dynamic>) {
              showErrorToast(
                  apiException.detail?[0] ?? ErrorMessages.networkGeneral);
            } else {
              showErrorToast(
                  apiException.detail?.toString().capitalizeFirst ?? ErrorMessages.networkGeneral);
            }
            if ((error.response?.statusCode == 403 ||
                error.response?.statusCode == 401) && !isLogin) {

              AppUtils appUtils = AppUtils();
              appUtils.logout();
            }
          } catch (e) {
            showErrorToast(ErrorMessages.networkGeneral);
          }
        }
        break;
      default:
        showErrorToast(ErrorMessages.networkGeneral);
        break;
    }
  }

  static handleError(Exception error) {
    showErrorToast(ErrorMessages.networkGeneral);
  }
}
