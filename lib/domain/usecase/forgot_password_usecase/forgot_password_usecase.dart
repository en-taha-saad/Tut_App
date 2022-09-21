import 'package:flutter_app/data/network/models/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecase/base_usecase.dart';

class ForgotPasswordUseCase implements BaseUseCase<String, String> {
  final Repository _repository;
  ForgotPasswordUseCase(this._repository);
  @override
  Future<Either<Failure, String>> execute(String email) async {
    return await _repository.forgotPassword(email);
  }
}
