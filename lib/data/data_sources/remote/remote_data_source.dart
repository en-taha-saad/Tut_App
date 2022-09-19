import 'package:flutter_app/data/network/models/loginrequest.dart';
import 'package:flutter_app/data/responses/login_responses/login_responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}
