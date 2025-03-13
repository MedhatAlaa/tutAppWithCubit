// Authentication Models

class Customer {
  String id;
  String name;
  int numOfNotification;

  Customer(this.id, this.name, this.numOfNotification);
}

class Contacts {
  String phone;
  String email;
  String link;

  Contacts(this.phone, this.email, this.link);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication(this.customer, this.contacts);
}

// home models

class Service {
  int id;
  String title;
  String image;

  Service(this.id, this.title, this.image);
}

class BannerAd {
  int id;
  String title;
  String image;

  BannerAd(this.id, this.title, this.image);
}

class Stores {
  int id;
  String title;
  String image;

  Stores(this.id, this.title, this.image);
}

class Data {
  List<Service> service;
  List<BannerAd> bannerAd;
  List<Stores> stores;

  Data(this.service, this.bannerAd, this.stores);
}

class HomeData {
  Data data;

  HomeData(this.data);
}

// store details

class StoreDetails {
  int id;
  String image;
  String title;
  String details;
  String services;
  String about;

  StoreDetails(
      this.id, this.image, this.title, this.details, this.services, this.about);
}
