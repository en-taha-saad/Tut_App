import 'package:flutter_app/data/network/models/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app/data/network/models/forgot_password_request.dart';
import 'package:flutter_app/domain/models/forgot_password/forgot_password.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecase/base_usecase.dart';
import 'package:flutter_app/domain/usecase/forgot_password_usecase/forgot_password_usecase_input.dart';

class ForgotPasswordUseCase
    implements BaseUseCase<ForgotPasswordUseCaseInput, ForgotPassword> {
  final Repository _repository;
  ForgotPasswordUseCase(this._repository);
  @override
  Future<Either<Failure, ForgotPassword>> execute(
      ForgotPasswordUseCaseInput input) async {
    return await _repository.forgotPassword(
      ForgotPasswordRequest(input.email),
    );
  }
}
