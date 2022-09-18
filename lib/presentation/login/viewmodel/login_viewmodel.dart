import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter_app/domain/usecase/login_usecase/login_usecase.dart';
import 'package:flutter_app/domain/usecase/login_usecase/login_usecase_input.dart';
import 'package:flutter_app/presentation/base/baseviewmodel.dart';
import 'package:flutter_app/presentation/common/freezed_data_classes.dart';
import 'package:flutter_app/presentation/login/viewmodel/login_viewmodel_inputs.dart';
import 'package:flutter_app/presentation/login/viewmodel/login_viewmodel_outputs.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  // final LoginUseCase _loginUseCase;
  // LoginViewModel(this._loginUseCase);
  LoginViewModel();
  var loginObject = LoginObject("", "");

  @override
  void dispose() {
    _userNameController.close();
    _passwordController.close();
    _areAllInputsValidStreamController.close();
  }

  @override
  void start() {}

  // stream controllers outputs
  final StreamController _userNameController =
      StreamController<String>.broadcast();
  @override
  Sink get inputUsername => _userNameController.sink;
  bool _isUsernameValid(String username) => username.isNotEmpty;
  @override
  Stream<bool> get outputIsUsernameValid {
    return _userNameController.stream.map(
      (userName) => _isUsernameValid(userName),
    );
  }

  // stream controllers outputs
  final StreamController _passwordController =
      StreamController<String>.broadcast();
  @override
  Sink get inputPassword => _passwordController.sink;
  bool _isPasswordValid(String password) => password.isNotEmpty;
  @override
  Stream<bool> get outputIsPasswordValid {
    return _passwordController.stream.map(
      (password) => _isPasswordValid(password),
    );
  }

  // stream controllers outputs
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();
  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;
  bool _areAllInputsValid() =>
      _isUsernameValid(loginObject.username) &&
      _isPasswordValid(loginObject.password);
  @override
  Stream<bool> get outputAreAllInputsValid {
    return _areAllInputsValidStreamController.stream.map(
      (_) => _areAllInputsValid(),
    );
  }

  @override
  setUsername(String username) {
    inputUsername.add(username);
    loginObject = loginObject.copyWith(username: username);
    inputAreAllInputsValid.add(null);
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  login() async {
    // (await _loginUseCase.execute(
    //   LoginUseCaseInput(
    //     loginObject.username,
    //     loginObject.password,
    //   ),
    // ))
    //     .fold(
    //   (failure) => {
    //     // left -> failure
    //     debugPrint("failure = ${failure.message}")
    //   },
    //   (data) => {
    //     // right -> success (data)
    //     debugPrint("data = ${data.customer?.name}")
    //   },
    // );
  }
}
