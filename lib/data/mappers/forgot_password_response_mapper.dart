import 'package:flutter_app/app/constants.dart';
import 'package:flutter_app/app/extensions/non_null_string.dart';
import 'package:flutter_app/data/responses/responses.dart';

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  String toDomain() {
    return this?.support?.orEmpty() ?? Constants.empty;
  }
}
