import 'package:flutter_app/domain/models/home/banner_ad.dart';
import 'package:flutter_app/domain/models/home/service.dart';
import 'package:flutter_app/domain/models/home/store.dart';

class HomeData {
  List<Service> services;
  List<BannerAd> banners;
  List<Store> stores;

  HomeData(this.services, this.banners, this.stores);
}
