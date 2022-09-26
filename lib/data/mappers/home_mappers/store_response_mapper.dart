import 'package:flutter_app/app/constants.dart';
import 'package:flutter_app/app/extensions/non_null_int.dart';
import 'package:flutter_app/app/extensions/non_null_string.dart';
import 'package:flutter_app/data/responses/home_responses/home_responses.dart';
import 'package:flutter_app/domain/models/home_models/store.dart';

extension StoreResponseMapper on StoreResponse? {
  Store toDomain() {
    return Store(
      this?.id?.orZero() ?? Constants.zero,
      this?.title.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
    );
  }
}
