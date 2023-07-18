import 'package:flutter_cleanarchi_with_mvvm_finished/data/network/failure.dart';
import 'package:flutter_cleanarchi_with_mvvm_finished/domain/model/models.dart';
import 'package:flutter_cleanarchi_with_mvvm_finished/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';

class HomeUseCase implements BaseUseCase<void, HomeObject> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repository.getHomeData();
  }
}
