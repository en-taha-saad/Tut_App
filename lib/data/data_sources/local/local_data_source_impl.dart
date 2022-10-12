import 'package:flutter_app/data/data_sources/local/local_data_source.dart';
import 'package:flutter_app/data/responses/home_responses/home_responses.dart';

const cacheHomeKey = "cacheHomeKey";

class LocalDataSourceImpl implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = {};

  @override
  Future<HomeResponse> getHomeData() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveHomeToCache(HomeResponse homeResponse) async {
    cacheMap[cacheHomeKey] = CachedItem(homeResponse);
  }
}

class CachedItem {
  dynamic data;

  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}
