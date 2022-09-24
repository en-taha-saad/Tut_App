import 'package:flutter_app/data/data_sources/remote/remote_data_source.dart';
import 'package:flutter_app/data/mappers/home_mappers/home_object_response_mapper.dart';
import 'package:flutter_app/data/mappers/login_register_mappers/authentication_response_mapper.dart';
import 'package:flutter_app/data/mappers/forgot_password_response_mappers/forgot_password_response_mapper.dart';
import 'package:flutter_app/data/network/error_handler/api_internal_status.dart';
import 'package:flutter_app/data/network/error_handler/datasource_enum.dart';
import 'package:flutter_app/data/network/error_handler/datasource_extension.dart';
import 'package:flutter_app/data/network/error_handler/error_handler.dart';
import 'package:flutter_app/data/network/error_handler/response_messages.dart';
import 'package:flutter_app/data/network/internet_checker/network_info.dart';
import 'package:flutter_app/data/network/models/register_request.dart';
import 'package:flutter_app/domain/models/home_models/home_object.dart';
import 'package:flutter_app/domain/models/login_register_models/authentication.dart';
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
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.success) {
          // success reutrn either right
          return Right(response.toDomain());
        } else {
          // failure return either left business error
          return Left(
            Failure(
              ApiInternalStatus.failure,
              response.message ?? ResponseMessage.defaultError,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // its not connected to internet so return a failure
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet so we can call the api
      try {
        final response = await _remoteDataSource.forgotPassword(email);
        if (response.status == ApiInternalStatus.success) {
          // success reutrn either right

          return Right(response.toDomain());
        } else {
          // failure return either left business error
          return Left(
            Failure(
              ApiInternalStatus.failure,
              response.message ?? ResponseMessage.defaultError,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // its not connected to internet so return a failure
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(
    RegisterRequest registerRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet so we can call the api
      try {
        final response = await _remoteDataSource.register(registerRequest);
        if (response.status == ApiInternalStatus.success) {
          // success reutrn either right
          return Right(response.toDomain());
        } else {
          // failure return either left business error
          return Left(
            Failure(
              ApiInternalStatus.failure,
              response.message ?? ResponseMessage.defaultError,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // its not connected to internet so return a failure
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, HomeObject>> getHomeData() async {
    if (await _networkInfo.isConnected) {
      // its connected to internet so we can call the api
      try {
        final response = await _remoteDataSource.getHomeData();
        if (response.status == ApiInternalStatus.success) {
          // success reutrn either right
          return Right(response.toDomain());
        } else {
          // failure return either left business error
          return Left(
            Failure(
              ApiInternalStatus.failure,
              response.message ?? ResponseMessage.defaultError,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // its not connected to internet so return a failure
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
