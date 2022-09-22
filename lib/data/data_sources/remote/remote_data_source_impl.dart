import 'package:flutter_app/data/data_sources/remote/remote_data_source.dart';
import 'package:flutter_app/data/network/app_api.dart';
import 'package:flutter_app/data/network/models/loginrequest.dart';
import 'package:flutter_app/data/network/models/register_request.dart';
import 'package:flutter_app/data/responses/forget_password_responses/forget_password_responses.dart';
import 'package:flutter_app/data/responses/login_responses/login_responses.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    return await _appServiceClient.forgotPassword(email);
  }

  @override
  Future<AuthenticationResponse> register(
    RegisterRequest registerRequest,
  ) async {
    return await _appServiceClient.register(
      registerRequest.userName,
      registerRequest.countryMobileCode,
      registerRequest.mobileNumber,
      registerRequest.email,
      registerRequest.password,
      registerRequest.profilePicture,
    );
  }
}
