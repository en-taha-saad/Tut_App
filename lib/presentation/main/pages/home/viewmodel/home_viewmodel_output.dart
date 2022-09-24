import 'package:flutter_app/domain/models/home_models/banner_ad.dart';
import 'package:flutter_app/domain/models/home_models/service.dart';
import 'package:flutter_app/domain/models/home_models/store.dart';

abstract class HomeViewModelOutput {
  Stream<List<Store>> get outputStores;

  Stream<List<Service>> get outputServices;

  Stream<List<BannerAd>> get outputBanners;
}
