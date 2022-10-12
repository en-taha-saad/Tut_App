import 'package:flutter_app/data/data_sources/local/cached_item.dart';
import 'package:flutter_app/data/data_sources/local/cached_item_extension.dart';
import 'package:flutter_app/data/data_sources/local/local_data_source.dart';
import 'package:flutter_app/data/network/error_handler/datasource_enum.dart';
import 'package:flutter_app/data/network/error_handler/error_handler.dart';
import 'package:flutter_app/data/responses/home_responses/home_responses.dart';

const cacheHomeKey = "cacheHomeKey";
const cacheHomeInterval = 60 * 1000; // 1 minute cache in millis

class LocalDataSourceImpl implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = {};

  @override
  Future<HomeResponse> getHomeData() async {
    CachedItem? cachedItem = cacheMap[cacheHomeKey];

    if (cachedItem != null && cachedItem.isValid(cacheHomeInterval)) {
      // return the response from cache
      return cachedItem.data;
    } else {
      // return an error that cache is not there or its not valid
      throw ErrorHandler.handle(DataSource.cacheError);
    }
  }

  @override
  Future<void> saveHomeToCache(HomeResponse homeResponse) async {
    cacheMap[cacheHomeKey] = CachedItem(homeResponse);
  }
}
