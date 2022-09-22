import 'package:flutter_app/data/network/models/loginrequest.dart';
import 'package:flutter_app/data/network/models/register_request.dart';
import 'package:flutter_app/data/responses/forget_password_responses/forget_password_responses.dart';
import 'package:flutter_app/data/responses/login_responses/login_responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<ForgotPasswordResponse> forgotPassword(String email);
  Future<AuthenticationResponse> register(RegisterRequest registerRequest);
}
