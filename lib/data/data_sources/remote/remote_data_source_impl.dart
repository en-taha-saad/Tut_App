import 'package:flutter_app/data/data_sources/remote/remote_data_source.dart';
import 'package:flutter_app/data/network/app_api.dart';
import 'package:flutter_app/data/network/models/loginrequest.dart';
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
}
