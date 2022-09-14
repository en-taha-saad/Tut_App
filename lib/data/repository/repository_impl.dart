import 'package:flutter_app/data/data_sources/remote/remote_data_source.dart';
import 'package:flutter_app/data/mappers/authentication_response_mapper.dart';
import 'package:flutter_app/data/network/internet_checker/network_info.dart';
import 'package:flutter_app/domain/models/login/authentication.dart';
import 'package:flutter_app/data/network/models/loginrequest.dart';
import 'package:flutter_app/data/network/models/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet so we can call the api
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) {
        // success reutrn either right
        return Right(response.toDomain());
      } else {
        // failure return either left business error
        return Left(
          Failure(
            409,
            response.message ?? "Something went wrong",
          ),
        );
      }
    } else {
      // its not connected to internet so return a failure
      return Left(
        Failure(
          501,
          "please check your internet connection",
        ),
      );
    }
  }
}
