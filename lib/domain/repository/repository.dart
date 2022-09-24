import 'package:dartz/dartz.dart';
import 'package:flutter_app/data/network/models/failure.dart';
import 'package:flutter_app/data/network/models/loginrequest.dart';
import 'package:flutter_app/data/network/models/register_request.dart';
import 'package:flutter_app/domain/models/login_register_models/authentication.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, Authentication>> register(
    RegisterRequest registerRequest,
  );
}
