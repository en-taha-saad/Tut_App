import 'package:flutter_app/data/mappers/home_mappers/home_response_mapper.dart';
import 'package:flutter_app/data/responses/home_responses/home_responses.dart';
import 'package:flutter_app/domain/models/home_models/home_object.dart';

extension HomeObjectResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    return HomeObject(this?.data?.toDomain());
  }
}
