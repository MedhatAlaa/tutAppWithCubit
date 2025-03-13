import 'package:dartz/dartz.dart';
import 'package:new_tut_app/data/network/failure.dart';
import 'package:new_tut_app/data/network/request.dart';
import 'package:new_tut_app/domain/models/models.dart';
import 'package:new_tut_app/domain/repository/base_repository.dart';
import 'package:new_tut_app/domain/usecase/base_usecase.dart';

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
