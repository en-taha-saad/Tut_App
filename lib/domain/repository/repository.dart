import 'package:dartz/dartz.dart';
import 'package:flutter_app/data/network/models/failure.dart';
import 'package:flutter_app/data/network/models/loginrequest.dart';
import 'package:flutter_app/domain/models/login/authentication.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}