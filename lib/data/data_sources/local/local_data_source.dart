import 'package:flutter_app/data/responses/home_responses/home_responses.dart';

abstract class LocalDataSource {
  Future<HomeResponse> getHomeData();

  Future<void> saveHomeToCache(HomeResponse homeResponse);
}
