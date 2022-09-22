// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app/data/responses/shared/base_response.dart';
part 'forget_password_responses.g.dart';


@JsonSerializable()
class ForgotPasswordResponse extends BaseResponse {
  @JsonKey(name: 'support')
  String? support;

  ForgotPasswordResponse(this.support);

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}
