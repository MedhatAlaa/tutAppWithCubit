import 'package:dartz/dartz.dart';
import 'package:new_tut_app/data/network/failure.dart';
import 'package:new_tut_app/data/network/request.dart';
import 'package:new_tut_app/domain/models/models.dart';
import 'package:new_tut_app/domain/repository/base_repository.dart';
import 'package:new_tut_app/domain/usecase/base_usecase.dart';

class RegisterUseCase
    extends BaseUseCase<RegisterUseCaseInput, Authentication> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUseCaseInput input) async {
    return await _repository.register(
      RegisterRequest(
        input.userName,
        input.countryMobileCode,
        input.mobileNumber,
        input.email,
        input.password,
        input.profilePicture,
      ),
    );
  }
}

class RegisterUseCaseInput {
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String email;
  String password;
  String profilePicture;

  RegisterUseCaseInput(this.userName, this.countryMobileCode, this.mobileNumber,
      this.email, this.password, this.profilePicture);
}
