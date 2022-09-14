import 'package:flutter_app/domain/models/login/contacts.dart';
import 'package:flutter_app/domain/models/login/customer.dart';

class Authentication {
  Customer? customer;
  Contacts? contacts;
  Authentication(this.customer, this.contacts);
}


