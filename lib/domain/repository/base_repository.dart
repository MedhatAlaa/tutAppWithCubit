import 'package:dartz/dartz.dart';
import 'package:new_tut_app/data/network/failure.dart';
import 'package:new_tut_app/data/network/request.dart';
import 'package:new_tut_app/domain/models/models.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);

  Future<Either<Failure, String>> forgetPassword(String email);

  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest);

  Future<Either<Failure, HomeData>> getHome();

  Future<Either<Failure, StoreDetails>> getStoreDetails();
}
