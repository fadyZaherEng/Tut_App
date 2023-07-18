import 'package:flutter_cleanarchi_with_mvvm_finished/data/network/failure.dart';
import 'package:flutter_cleanarchi_with_mvvm_finished/data/network/requests.dart';
import 'package:flutter_cleanarchi_with_mvvm_finished/domain/model/models.dart';
import 'package:flutter_cleanarchi_with_mvvm_finished/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
