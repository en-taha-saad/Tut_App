// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'forget_password_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseForgotPasswordResponse _$BaseForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    BaseForgotPasswordResponse()
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..support = json['support'] as String?;

Map<String, dynamic> _$BaseForgotPasswordResponseToJson(
        BaseForgotPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'support': instance.support,
    };

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordResponse()
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..support = json['support'] as String?;

Map<String, dynamic> _$ForgotPasswordResponseToJson(
        ForgotPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'support': instance.support,
    };
