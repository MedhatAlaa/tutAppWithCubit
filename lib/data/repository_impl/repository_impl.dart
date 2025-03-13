import 'package:dartz/dartz.dart';
import 'package:new_tut_app/data/data_source/remote_data_source.dart';
import 'package:new_tut_app/data/mapper/mapper.dart';
import 'package:new_tut_app/data/network/error_handler.dart';
import 'package:new_tut_app/data/network/failure.dart';
import 'package:new_tut_app/data/network/request.dart';
import 'package:new_tut_app/domain/models/models.dart';
import 'package:new_tut_app/domain/repository/base_repository.dart';

import '../network/network_info.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == AppInternalServer.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(AppInternalServer.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> forgetPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.forgetPassword(email);
        if (response.status == AppInternalServer.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(AppInternalServer.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.register(registerRequest);
        if (response.status == AppInternalServer.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            AppInternalServer.FAILURE,
            response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, HomeData>> getHome() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getHome();
        if (response.status == AppInternalServer.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(AppInternalServer.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, StoreDetails>> getStoreDetails() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getStoreDetails();
        if (response.status == AppInternalServer.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              AppInternalServer.FAILURE,
              response.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
