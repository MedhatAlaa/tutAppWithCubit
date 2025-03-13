import 'dart:ffi';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_tut_app/domain/usecase/home_usecase.dart';
import 'package:new_tut_app/domain/usecase/store_details_usecase.dart';
import 'package:new_tut_app/presentation/home/cubit/states.dart';
import 'package:new_tut_app/presentation/home/products/products_view.dart';
import 'package:new_tut_app/presentation/home/services/services_view.dart';
import 'package:new_tut_app/presentation/home/settings/settings_view.dart';
import 'package:new_tut_app/presentation/home/store_details/store_details_view.dart';

import '../../../domain/models/models.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this._homeUseCase, this._storeDetailsUseCase)
      : super(InitialHomeState());

  final HomeUseCase _homeUseCase;
  final StoreDetailsUseCase _storeDetailsUseCase;

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<String> titles = [
    'Home',
    'Store Details',
    'Services',
    'Settings',
  ];

  List<Widget> screens = [
    const ProductsView(),
    const StoreDetailsView(),
    const ServicesView(),
    const SettingsView(),
  ];

  void changeBottomNav(index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  List<Service> services = [];
  List<BannerAd> banner = [];
  List<Stores> stores = [];
  late StoreDetails storeDetails;

  void getHome() async {
    emit(GetHomeLoadingState());
    final response = await _homeUseCase.execute(Void);

    response.fold((failure) {
      emit(GetHomeErrorState());
    }, (data) {
      services = data.data.service;
      banner = data.data.bannerAd;
      stores = data.data.stores;
      emit(GetHomeSuccessState());
    });
  }

  void getStoreDetails() async {
    emit(GetStoreDetailsLoadingState());
    final response = await _storeDetailsUseCase.execute(Void);

    response.fold((failure) {
      emit(GetStoreDetailsErrorState());
    }, (data) {
      storeDetails = data;
      emit(GetStoreDetailsSuccessState());
    });
  }
}
