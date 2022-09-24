import 'package:flutter_app/data/mappers/home_mappers/banner_response_mapper.dart';
import 'package:flutter_app/data/mappers/home_mappers/service_response_mapper.dart';
import 'package:flutter_app/data/mappers/home_mappers/store_response_mapper.dart';
import 'package:flutter_app/data/responses/home_responses/home_responses.dart';
import 'package:flutter_app/domain/models/home_models/banner_ad.dart';
import 'package:flutter_app/domain/models/home_models/home_data.dart';
import 'package:flutter_app/domain/models/home_models/service.dart';
import 'package:flutter_app/domain/models/home_models/store.dart';

extension HomeDataResponseMapper on HomeDataResponse? {
  HomeData toDomain() {
    List<Service> services = (this?.services?.map(
                  (serviceResponse) => serviceResponse.toDomain(),
                ) ??
            const Iterable.empty())
        .cast<Service>()
        .toList();

    List<BannerAd> banners = (this?.banners?.map(
                  (bannersResponse) => bannersResponse.toDomain(),
                ) ??
            const Iterable.empty())
        .cast<BannerAd>()
        .toList();

    List<Store> stores = (this?.stores?.map(
                  (storesResponse) => storesResponse.toDomain(),
                ) ??
            const Iterable.empty())
        .cast<Store>()
        .toList();

    return HomeData(services, banners, stores);
  }
}
