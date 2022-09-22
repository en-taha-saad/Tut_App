import 'package:flutter_app/data/network/models/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app/data/network/models/loginrequest.dart';
import 'package:flutter_app/domain/models/login/authentication.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecase/base_usecase.dart';
import 'package:flutter_app/domain/usecase/register_usecase/register_usecase_input.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  final Repository _repository;
  RegisterUseCase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUseCaseInput input) async {
    return await _repository.login(
      LoginRequest(input.email, input.password),
    );
  }
}
