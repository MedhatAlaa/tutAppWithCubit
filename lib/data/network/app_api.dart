import 'package:dio/dio.dart';
import 'package:new_tut_app/app/constants.dart';
import 'package:retrofit/retrofit.dart';
import '../responses/responses.dart';

part 'app_api.g.dart';


@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  /// get body of login
  @POST(Constants.login)
  Future<AuthenticationResponse> login(
    @Field('email') String email,
    @Field('password') String password,
  );

  /// get body of forgetPassword
  @POST(Constants.forgetPassword)
  Future<ForgetPasswordResponse> forgetPassword(
    @Field('email') String email,
  );

  /// get body of register
  @POST(Constants.register)
  Future<AuthenticationResponse> register(
    @Field('user_name') String userName,
    @Field('country_mobile_code') String countryMobileCode,
    @Field('mobile_number') String mobileNumber,
    @Field('email') String email,
    @Field('password') String password,
    @Field('profile_picture') String profilePicture,
  );

  /// get body of home
  @GET(Constants.home)
  Future<HomeResponse> getHome();

  /// get store details body
  @GET(Constants.storeDetails)
  Future<StoreDetailsResponse> getStoreDetails();
}
