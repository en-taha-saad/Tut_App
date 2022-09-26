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
    with HomeViewModelInput, HomeViewModelOutput {
  final StreamController _bannersStreamController =
      BehaviorSubject<List<BannerAd>>();
  final StreamController _servicesStreamController =
      BehaviorSubject<List<Service>>();
  final StreamController _storesStreamController =
      BehaviorSubject<List<Store>>();

  final HomeUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase);

  @override
  void start() {}

  @override
  void dispose() {
    _bannersStreamController.close();
    _servicesStreamController.close();
    _storesStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputBanners => _bannersStreamController.sink;
  @override
  Sink get inputServices => _servicesStreamController.sink;
  @override
  Sink get inputStores => _storesStreamController.sink;

  @override
  Stream<List<BannerAd>> get outputBanners =>
      _bannersStreamController.stream.map((banners) => banners);

  @override
  Stream<List<Service>> get outputServices =>
      _servicesStreamController.stream.map((services) => services);

  @override
  Stream<List<Store>> get outputStores =>
      _storesStreamController.stream.map((stores) => stores);
}
