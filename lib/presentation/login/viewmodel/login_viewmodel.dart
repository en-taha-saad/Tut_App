import 'dart:async';

import 'package:flutter_app/presentation/base/baseviewmodel.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  // stream controllers outputs
  final StreamController _userNameController =
      StreamController<String>.broadcast();
  final StreamController _passwordController =
      StreamController<String>.broadcast();

  @override
  void dispose() {
    _userNameController.close();
    _passwordController.close();
  }

  @override
  void start() {}

  @override
  Sink get inputPassword => _userNameController.sink;

  @override
  Sink get inputUsername => _passwordController.sink;

  @override
  setPassword(String password) {
    throw UnimplementedError();
  }

  @override
  setUsername(String username) {
    throw UnimplementedError();
  }

  @override
  login() {
    throw UnimplementedError();
  }

  @override
  Stream<bool> get outputIsUsernameValid {
    return _userNameController.stream.map(
      (userName) => _isUsernameValid(userName),
    );
  }

  @override
  Stream<bool> get outputIsPasswordValid {
    return _passwordController.stream.map(
      (password) => _isPasswordValid(password),
    );
  }

  bool _isUsernameValid(String username) => username.isNotEmpty;

  bool _isPasswordValid(String password) => password.isNotEmpty;
}

// inputs mean that "Orders" that our view model will receive from view
abstract class LoginViewModelInputs {
  setUsername(String username);
  setPassword(String password);
  login();

  // stream controller input
  Sink get inputUsername;
  Sink get inputPassword;
}

abstract class LoginViewModelOutputs {
  // stream controller output
  Stream<bool> get outputIsUsernameValid;
  Stream<bool> get outputIsPasswordValid;
}
