import 'dart:async';

import 'package:flutter_app/domain/usecase/forgot_password_usecase/forgot_password_usecase.dart';
import 'package:flutter_app/presentation/common/freezed_data_classes.dart';
import 'package:flutter_app/presentation/forgot_password/viewmodel/forgot_password_viewmodel_inputs.dart';
import 'package:flutter_app/presentation/forgot_password/viewmodel/forgot_password_viewmodel_outputs.dart';
import '../../base/base_viewmodel.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInputs, ForgotPasswordViewModelOutputs {
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  ForgotPasswordViewModel(this._forgotPasswordUseCase);
  var forgotPasswordObject = ForgotPasswordObject("");

  @override
  void start() {}
  @override
  void dispose() {
    _emailController.close();
    _areSentVerificationStreamController.close();
  }

  @override
  forgotPassword() {
    //     inputState.add(
    //   LoadingState(stateRendererType: StateRendererType.popupLoadingState),
    // );
    // (await _forgotPasswordUseCase.execute(
    //   LoginUseCaseInput(
    //     loginObject.username,
    //     loginObject.password,
    //   ),
    // ))
    //     .fold(
    //   (failure) {
    //     // left -> failure
    //     inputState.add(
    //       ErrorState(
    //         StateRendererType.popupErrorState,
    //         failure.message,
    //       ),
    //     );
    //     debugPrint("failure = ${failure.message}");
    //   },
    //   (data) {
    //     // right -> success (data)
    //     inputState.add(ContentState());
    //     isUserLoggedinSuccessfullyStreamController.add(true);
    //     debugPrint("data = ${data.customer?.name}");
    //   },
    // );
    // }
  }
  @override
  resendVerification() => throw UnimplementedError();

  // email
  final StreamController _emailController =
      StreamController<String>.broadcast();
  @override
  Sink get inputEmail => _emailController.sink;
  bool _isUsernameValid(String email) => email.isNotEmpty;
  @override
  setEmail(String email) {
    forgotPasswordObject = forgotPasswordObject.copyWith(email: email);
    inputEmail.add(email);
  }

  @override
  Stream<bool> get outputIsEmailValid => _emailController.stream.map(
        (email) => _isUsernameValid(email),
      );

  // areSentVerification
  final StreamController _areSentVerificationStreamController =
      StreamController<void>.broadcast();
  @override
  Sink get inputAreSentVerification =>
      _areSentVerificationStreamController.sink;
  bool _areAllInputsValid() => _isUsernameValid(forgotPasswordObject.email);
  @override
  Stream<bool> get outputAreSentVerification =>
      _areSentVerificationStreamController.stream.map(
        (_) => _areAllInputsValid(),
      );
}
