// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'forget_password_responses.g.dart';

@JsonSerializable()
class BaseForgotPasswordResponse {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'support')
  String? support;
}

@JsonSerializable()
class ForgotPasswordResponse extends BaseForgotPasswordResponse {
  ForgotPasswordResponse();

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}
