import 'package:flutter_app/app/constants.dart';
import 'package:flutter_app/app/extensions/non_null_string.dart';
import 'package:flutter_app/app/extensions/non_null_int.dart';
import 'package:flutter_app/data/responses/login_register_responses/login_register_responses.dart';
import 'package:flutter_app/domain/models/login/customer.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.numOfNotifications.orZero() ?? Constants.zero,
    );
  }
}
