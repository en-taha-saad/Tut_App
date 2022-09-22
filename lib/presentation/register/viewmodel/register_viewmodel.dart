import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter_app/domain/usecase/register_usecase/register_usecase.dart';
import 'package:flutter_app/domain/usecase/register_usecase/register_usecase_input.dart';
import 'package:flutter_app/presentation/base/base_viewmodel.dart';
import 'package:flutter_app/presentation/common/freezed_data_classes.dart';
import 'package:flutter_app/presentation/common/state_render/states/content_state.dart';
import 'package:flutter_app/presentation/common/state_render/states/error_state.dart';
import 'package:flutter_app/presentation/common/state_render/states/loading_state.dart';
import 'package:flutter_app/presentation/common/state_render/states/state_renderer_type.dart';
import 'package:flutter_app/presentation/register/viewmodel/register_viewmodel_inputs.dart';
import 'package:flutter_app/presentation/register/viewmodel/register_viewmodel_outputs.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInputs, RegisterViewModelOutputs {
  final RegisterUseCase _registerUseCase;
  RegisterViewModel(this._registerUseCase);
  var registerObject = RegisterObject("", "", "", "", "", "");

  final StreamController _userNameController =
      StreamController<String>.broadcast();
  final StreamController _countryMobileCodeController =
      StreamController<String>.broadcast();
  final StreamController _mobileNumberController =
      StreamController<String>.broadcast();
  final StreamController _emailController =
      StreamController<String>.broadcast();
  final StreamController _passwordController =
      StreamController<String>.broadcast();
  final StreamController _profilePictureController =
      StreamController<String>.broadcast();
  final StreamController _areAllInputsValidController =
      StreamController<String>.broadcast();

  @override
  void dispose() {
    super.dispose();
    _userNameController.close();
    _countryMobileCodeController.close();
    _mobileNumberController.close();
    _emailController.close();
    _passwordController.close();
    _profilePictureController.close();
    _areAllInputsValidController.close();
  }

  @override
  void start() {
    // view model should tell view, please show content state
    inputState.add(ContentState());
  }

  @override
  register() async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.popupLoadingState),
    );
    (await _registerUseCase.execute(
      RegisterUseCaseInput(
        registerObject.userName,
        registerObject.countryMobileCode,
        registerObject.mobileNumber,
        registerObject.email,
        registerObject.password,
        registerObject.profilePicture,
      ),
    ))
        .fold(
      (failure) {
        // left -> failure
        inputState.add(
          ErrorState(
            StateRendererType.popupErrorState,
            failure.message,
          ),
        );
        debugPrint("failure = ${failure.message}");
      },
      (data) {
        // right -> success (data)
        inputState.add(ContentState());
        debugPrint("data = ${data.customer?.name}");
      },
    );
  }

  // sink inputs
  @override
  Sink get inputCountryMobileCode => _countryMobileCodeController.sink;
  @override
  Sink get inputEmail => _emailController.sink;
  @override
  Sink get inputMobileNumber => _mobileNumberController.sink;
  @override
  Sink get inputProfilePicture => _profilePictureController.sink;
  @override
  Sink get inputUserName => _userNameController.sink;
  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidController.sink;
  @override
  Sink get inputPassword => _passwordController.sink;

  // validations
  bool _isCountryMobileCodeValid(String countryMobileCode) =>
      countryMobileCode.isNotEmpty;
  bool _isEmailValid(String email) => email.isNotEmpty;
  bool _isUsernameValid(String username) => username.isNotEmpty;
  bool _isPasswordValid(String password) => password.isNotEmpty;
  bool _isMobileNumberValid(String mobileNumber) => mobileNumber.isNotEmpty;
  bool _isProfilePictureValid(String profilePicture) =>
      profilePicture.isNotEmpty;
  bool _isUserNameValid(String userName) => userName.isNotEmpty;
  bool _areAllInputsValid() =>
      _isUsernameValid(registerObject.userName) &&
      _isPasswordValid(registerObject.password) &&
      _isCountryMobileCodeValid(registerObject.countryMobileCode) &&
      _isEmailValid(registerObject.email) &&
      _isMobileNumberValid(registerObject.mobileNumber) &&
      _isProfilePictureValid(registerObject.profilePicture);

  // stream outputs
  @override
  Stream<bool> get outputIsCountryMobileCodeValid =>
      _countryMobileCodeController.stream.map(
        (countryMobileCode) => _isCountryMobileCodeValid(countryMobileCode),
      );
  @override
  Stream<bool> get outputIsEmailValid => _emailController.stream.map(
        (email) => _isEmailValid(email),
      );
  @override
  Stream<bool> get outputIsMobileNumberValid =>
      _mobileNumberController.stream.map(
        (mobileNumber) => _isMobileNumberValid(mobileNumber),
      );
  @override
  Stream<bool> get outputIsProfilePictureValid =>
      _profilePictureController.stream.map(
        (profilePicture) => _isProfilePictureValid(profilePicture),
      );
  @override
  Stream<bool> get outputIsUserNameValid => _userNameController.stream.map(
        (userName) => _isUserNameValid(userName),
      );
  @override
  Stream<bool> get outputIsPasswordValid => _passwordController.stream.map(
        (password) => _isPasswordValid(password),
      );
  @override
  Stream<bool> get outputAreAllInputsValid =>
      _areAllInputsValidController.stream.map((_) => _areAllInputsValid());

  // set values
  @override
  setCountryMobileCode(String countryMobileCode) {
    inputCountryMobileCode.add(countryMobileCode);
    registerObject = registerObject.copyWith(
      countryMobileCode: countryMobileCode,
    );
    inputAreAllInputsValid.add(null);
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    registerObject = registerObject.copyWith(email: email);
    inputAreAllInputsValid.add(null);
  }

  @override
  setMobileNumber(String mobileNumber) {
    inputMobileNumber.add(mobileNumber);
    registerObject = registerObject.copyWith(mobileNumber: mobileNumber);
    inputAreAllInputsValid.add(null);
  }

  @override
  setProfilePicture(String profilePicture) {
    inputProfilePicture.add(profilePicture);
    registerObject = registerObject.copyWith(profilePicture: profilePicture);
    inputAreAllInputsValid.add(null);
  }

  @override
  setUserName(String username) {
    inputUserName.add(username);
    registerObject = registerObject.copyWith(userName: username);
    inputAreAllInputsValid.add(null);
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    registerObject = registerObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }
}
