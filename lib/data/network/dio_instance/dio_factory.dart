import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/app/constants.dart';
import 'package:flutter_app/data/network/dio_instance/dio_instance_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    // ignore: no_leading_underscores_for_local_identifiers
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHERIZATION: Constants.token,
      DEFAULT_LANGUAGE: 'en', // todo change to get lang from app prefs
    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: Constants.apiTimeOut,
      receiveTimeout: Constants.apiTimeOut,
      headers: headers,
    );

    if (!kReleaseMode) {
      // its for debug m ode only
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
    return dio;
  }
}
