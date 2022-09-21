import 'package:dio/dio.dart';
import 'package:flutter_app/app/constants.dart';
import 'package:flutter_app/data/responses/forget_password_responses/forget_password_responses.dart';
import 'package:flutter_app/data/responses/login_responses/login_responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customer/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("/customer/forgotPassword")
  Future<ForgotPasswordResponse> forgotPassword(@Field("email") String email);
}
