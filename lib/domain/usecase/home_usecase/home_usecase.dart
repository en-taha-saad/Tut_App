import 'package:dartz/dartz.dart';
import 'package:flutter_app/data/network/models/failure.dart';
import 'package:flutter_app/domain/models/home_models/home_object.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecase/base_usecase.dart';

class HomeUseCase implements BaseUseCase<void, HomeObject> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repository.getHomeData();
  }
}
