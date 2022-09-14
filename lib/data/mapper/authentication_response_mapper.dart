import 'package:flutter_app/data/mapper/contacts_response_mapper.dart';
import 'package:flutter_app/data/mapper/customer_response_mapper.dart';
import 'package:flutter_app/data/response/responses.dart';
import 'package:flutter_app/domain/models/login/authentication.dart';

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contacts.toDomain(),
    );
  }
}
