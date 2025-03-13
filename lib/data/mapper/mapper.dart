import 'package:new_tut_app/app/constants.dart';
import 'package:new_tut_app/app/extension.dart';
import 'package:new_tut_app/domain/models/models.dart';
import '../responses/responses.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constants.emptyString,
      this?.name.orEmpty() ?? Constants.emptyString,
      this?.numOfNotification.orZero() ?? Constants.emptyInt,
    );
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.orEmpty() ?? Constants.emptyString,
      this?.email.orEmpty() ?? Constants.emptyString,
      this?.link.orEmpty() ?? Constants.emptyString,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contacts.toDomain(),
    );
  }
}

extension ForgetPasswordResponseMapper on ForgetPasswordResponse? {
  String toDomain() {
    return this?.supportMessage?.orEmpty() ?? Constants.emptyString;
  }
}

// home extensions

extension ServiceResponseExtension on ServiceResponse? {
  Service toDomain() {
    return Service(
      this?.id.orZero() ?? Constants.emptyInt,
      this?.title.orEmpty() ?? Constants.emptyString,
      this?.image.orEmpty() ?? Constants.emptyString,
    );
  }
}

extension BannerResponseExtension on BannerResponse? {
  BannerAd toDomain() {
    return BannerAd(
      this?.id.orZero() ?? Constants.emptyInt,
      this?.title.orEmpty() ?? Constants.emptyString,
      this?.image.orEmpty() ?? Constants.emptyString,
    );
  }
}

extension StoresResponseExtension on StoresResponse? {
  Stores toDomain() {
    return Stores(
      this?.id.orZero() ?? Constants.emptyInt,
      this?.title.orEmpty() ?? Constants.emptyString,
      this?.image.orEmpty() ?? Constants.emptyString,
    );
  }
}

extension DataResponseExtension on HomeResponse? {
  HomeData toDomain() {
    List<Service> service = (this
                ?.data
                ?.services
                ?.map((servicesResponse) => servicesResponse.toDomain()) ??
            const Iterable.empty())
        .cast<Service>()
        .toList();

    List<BannerAd> bannerAd = (this
                ?.data
                ?.banners
                ?.map((bannerResponse) => bannerResponse.toDomain()) ??
            const Iterable.empty())
        .cast<BannerAd>()
        .toList();

    List<Stores> stores = (this
                ?.data
                ?.stores
                ?.map((storesResponse) => storesResponse.toDomain()) ??
            const Iterable.empty())
        .cast<Stores>()
        .toList();

    var data = Data(service, bannerAd, stores);
    return HomeData(data);
  }
}

extension StoreDetailsExtension on StoreDetailsResponse? {
  StoreDetails toDomain() {
    return StoreDetails(
      this?.id.orZero() ?? Constants.emptyInt,
      this?.image.orEmpty() ?? Constants.emptyString,
      this?.title.orEmpty() ?? Constants.emptyString,
      this?.details.orEmpty() ?? Constants.emptyString,
      this?.about.orEmpty() ?? Constants.emptyString,
      this?.services.orEmpty() ?? Constants.emptyString,
    );
  }
}
