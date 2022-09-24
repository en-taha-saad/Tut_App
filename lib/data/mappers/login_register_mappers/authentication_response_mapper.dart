import 'package:flutter_app/data/mappers/login_register_mappers/contacts_response_mapper.dart';
import 'package:flutter_app/data/mappers/login_register_mappers/customer_response_mapper.dart';
import 'package:flutter_app/data/responses/login_register_responses/login_register_responses.dart';
import 'package:flutter_app/domain/models/login_register_models/authentication.dart';

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contacts.toDomain(),
    );
  }
}
