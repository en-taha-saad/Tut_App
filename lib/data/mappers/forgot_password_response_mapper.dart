import 'package:flutter_app/app/constants.dart';
import 'package:flutter_app/data/responses/forget_password_responses/forget_password_responses.dart';
import 'package:flutter_app/app/extensions/non_null_string.dart';

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  String toDomain() {
    return this?.support?.orEmpty() ?? Constants.empty;
  }
}
