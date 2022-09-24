
import 'dart:async';

import 'package:flutter_app/domain/models/home_models/banner_ad.dart';
import 'package:flutter_app/domain/models/home_models/service.dart';
import 'package:flutter_app/domain/models/home_models/store.dart';
import 'package:flutter_app/domain/usecase/home_usecase/home_usecase.dart';
import 'package:flutter_app/presentation/base/base_viewmodel.dart';
import 'package:flutter_app/presentation/main/pages/home/viewmodel/home_viewmodel_input.dart';
import 'package:flutter_app/presentation/main/pages/home/viewmodel/home_viewmodel_output.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelInput, HomeViewModelOutput {  final StreamController _bannersStreamController = BehaviorSubject<
      List<BannerAd>>();
  final StreamController _servicesStreamController = BehaviorSubject<
      List<Service>>();
  final StreamController _storesStreamController = BehaviorSubject<
      List<Store>>();

  final HomeUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase)

  @override
  void start() {
  }

  @override
  void dispose() {
    _bannersStreamController.close();
    _servicesStreamController.close();
    _storesStreamController.close();
    super.dispose();
  }

  @override
  // TODO: implement inputBanners
  Sink get inputBanners => throw UnimplementedError();
  
  @override
  // TODO: implement inputServices
  Sink get inputServices => throw UnimplementedError();
  
  @override
  // TODO: implement inputStores
  Sink get inputStores => throw UnimplementedError();
  
  @override
  // TODO: implement outputBanners
  Stream<List<BannerAd>> get outputBanners => throw UnimplementedError();
  
  @override
  // TODO: implement outputServices
  Stream<List<Service>> get outputServices => throw UnimplementedError();
  
  @override
  // TODO: implement outputStores
  Stream<List<Store>> get outputStores => throw UnimplementedError();
  

}