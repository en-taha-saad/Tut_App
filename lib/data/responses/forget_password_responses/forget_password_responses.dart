// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'support')
  String? support;
}

@JsonSerializable()
class ForgotPasswordResponse extends BaseResponse {
  ForgotPasswordResponse();
}
