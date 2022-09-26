import 'package:flutter_app/domain/models/home_models/banner_ad.dart';
import 'package:flutter_app/domain/models/home_models/service.dart';
import 'package:flutter_app/domain/models/home_models/store.dart';

class HomeViewObject {
  List<BannerAd> banners;
  List<Service> services;
  List<Store> stores;

  HomeViewObject(this.banners, this.services, this.stores);
}
