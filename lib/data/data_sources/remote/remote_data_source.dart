import 'package:flutter_app/data/network/models/loginrequest.dart';
import 'package:flutter_app/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<ForgotPasswordResponse> forgotPassword(String email);
}
