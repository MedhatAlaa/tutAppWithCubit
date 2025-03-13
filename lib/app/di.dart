// todo service locator using get it

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:new_tut_app/app/app_pref.dart';
import 'package:new_tut_app/data/data_source/remote_data_source.dart';
import 'package:new_tut_app/data/network/app_api.dart';
import 'package:new_tut_app/data/network/dio_factory.dart';
import 'package:new_tut_app/data/network/network_info.dart';
import 'package:new_tut_app/data/repository_impl/repository_impl.dart';
import 'package:new_tut_app/domain/repository/base_repository.dart';
import 'package:new_tut_app/domain/usecase/forget_password_usecase.dart';
import 'package:new_tut_app/domain/usecase/home_usecase.dart';
import 'package:new_tut_app/domain/usecase/login_usecase.dart';
import 'package:new_tut_app/domain/usecase/register_usecase.dart';
import 'package:new_tut_app/domain/usecase/store_details_usecase.dart';
import 'package:new_tut_app/presentation/home/cubit/cubit.dart';
import 'package:new_tut_app/presentation/login/cubit/login_cubit.dart';
import 'package:new_tut_app/presentation/register/cubit/register_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/forget_password/cubit/forget_password_cubit.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  /// Shared Prefs
  sl.registerLazySingleton<SharedPreferences>(() => (sharedPreferences));

  /// App Prefs
  sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

  /// Dio Factory
  sl.registerLazySingleton<DioFactory>(() => DioFactory(sl()));

  /// App Service Client
  Dio dio = await sl<DioFactory>().getDio();
  sl.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  /// Network info
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  /// Remote Data Source
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));

  /// Repository
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(sl(), sl()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    sl.registerFactory<LoginUseCase>(() => LoginUseCase(sl()));
    sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
  }
}

initForgetPasswordModule() {
  if (!GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    sl.registerFactory<ForgetPasswordUseCase>(
        () => ForgetPasswordUseCase(sl()));
    sl.registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(sl()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    sl.registerFactory<RegisterUseCase>(() => RegisterUseCase(sl()));
    sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl()));
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    sl.registerFactory<HomeUseCase>(() => HomeUseCase(sl()));
    sl.registerFactory<StoreDetailsUseCase>(() => StoreDetailsUseCase(sl()));
    sl.registerFactory<HomeCubit>(() => HomeCubit(sl(), sl()));
  }
}
