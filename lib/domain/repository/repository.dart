import 'package:dartz/dartz.dart';
import 'package:flutter_app/data/network/models/failure.dart';
import 'package:flutter_app/data/network/models/forgot_password_request.dart';
import 'package:flutter_app/data/network/models/loginrequest.dart';
import 'package:flutter_app/domain/models/forgot_password/forgot_password.dart';
import 'package:flutter_app/domain/models/login/authentication.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, ForgotPassword>> forgotPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  );
}
