import 'package:flutter_app/domain/models/login_register_models/contacts.dart';
import 'package:flutter_app/domain/models/login_register_models/customer.dart';

class Authentication {
  Customer? customer;
  Contacts? contacts;
  Authentication(this.customer, this.contacts);
}


