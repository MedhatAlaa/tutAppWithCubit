
import 'package:dartz/dartz.dart';
import 'package:new_tut_app/data/network/failure.dart';
import 'package:new_tut_app/domain/models/models.dart';
import 'package:new_tut_app/domain/repository/base_repository.dart';
import 'package:new_tut_app/domain/usecase/base_usecase.dart';

class HomeUseCase extends BaseUseCase<void, HomeData> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeData>> execute(void input) async {
    return await _repository.getHome();
  }
}
