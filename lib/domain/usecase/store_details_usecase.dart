import 'package:dartz/dartz.dart';
import 'package:new_tut_app/data/network/failure.dart';
import 'package:new_tut_app/domain/models/models.dart';
import 'package:new_tut_app/domain/repository/base_repository.dart';

import 'base_usecase.dart';

class StoreDetailsUseCase extends BaseUseCase<void, StoreDetails> {
  final Repository _repository;

  StoreDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, StoreDetails>> execute(void input) async {
    return await _repository.getStoreDetails();
  }
}
