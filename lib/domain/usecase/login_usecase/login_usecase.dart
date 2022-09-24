import 'package:flutter_app/data/network/models/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app/data/network/models/loginrequest.dart';
import 'package:flutter_app/domain/models/login_register_models/authentication.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecase/base_usecase.dart';
import 'package:flutter_app/domain/usecase/login_usecase/login_usecase_input.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(
      LoginRequest(input.email, input.password),
    );
  }
}
