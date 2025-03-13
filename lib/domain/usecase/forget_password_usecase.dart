import 'package:dartz/dartz.dart';
import 'package:new_tut_app/data/network/failure.dart';
import 'package:new_tut_app/domain/repository/base_repository.dart';
import 'package:new_tut_app/domain/usecase/base_usecase.dart';

class ForgetPasswordUseCase implements BaseUseCase<String, String> {
  final Repository _repository;

  ForgetPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) async {
    return await _repository.forgetPassword(input);
  }
}
