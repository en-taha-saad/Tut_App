import 'package:flutter_app/data/mappers/contacts_response_mapper.dart';
import 'package:flutter_app/data/mappers/customer_response_mapper.dart';
import 'package:flutter_app/data/responses/login_register_responses/login_register_responses.dart';
import 'package:flutter_app/domain/models/login/authentication.dart';

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contacts.toDomain(),
    );
  }
}
