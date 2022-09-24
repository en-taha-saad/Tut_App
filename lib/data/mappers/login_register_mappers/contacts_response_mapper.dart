import 'package:flutter_app/app/constants.dart';
import 'package:flutter_app/data/responses/login_register_responses/login_register_responses.dart';
import 'package:flutter_app/domain/models/login_register_models/contacts.dart';
import 'package:flutter_app/app/extensions/non_null_string.dart';

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty,
    );
  }
}
