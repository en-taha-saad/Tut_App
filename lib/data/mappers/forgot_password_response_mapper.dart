import 'package:flutter_app/app/constants.dart';
import 'package:flutter_app/app/extensions/non_null_int.dart';
import 'package:flutter_app/data/responses/forget_password_responses/forget_password_responses.dart';
import 'package:flutter_app/domain/models/forgot_password/forgot_password.dart';
import 'package:flutter_app/app/extensions/non_null_string.dart';

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  ForgotPassword toDomain() {
    return ForgotPassword(
      this?.status.orZero() ?? Constants.zero,
      this?.message.orEmpty() ?? Constants.empty,
      this?.support.orEmpty() ?? Constants.empty,
    );
  }
}
