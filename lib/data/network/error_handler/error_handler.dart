import 'package:dio/dio.dart';
import 'package:flutter_app/data/network/error_handler/datasource_enum.dart';
import 'package:flutter_app/data/network/error_handler/datasource_extension.dart';
import 'package:flutter_app/data/network/models/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // the error is from the Dio itself or from api
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.RECIEVE_TIMEOUT.getFailure();
      case DioErrorType.response:
        return _handleResponseError(error);
      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleResponseError(DioError error) {
    switch (error.response!.statusCode) {
      case 400:
        return DataSource.BAD_REQUEST.getFailure();
      case 401:
        return DataSource.UNAUTHORIZED.getFailure();
      case 403:
        return DataSource.FORBIDDEN.getFailure();
      case 404:
        return DataSource.NOT_FOUND.getFailure();
      case 500:
        return DataSource.INTERNAL_SERVER_ERROR.getFailure();
      default:
        return DataSource.DEFAULT.getFailure();
    }
  }
}
