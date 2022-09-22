import 'dart:async';

import 'package:flutter_app/app/functions.dart';
import 'package:flutter_app/domain/usecase/forgot_password_usecase/forgot_password_usecase.dart';
import 'package:flutter_app/presentation/common/state_render/states/content_state.dart';
import 'package:flutter_app/presentation/common/state_render/states/error_state.dart';
import 'package:flutter_app/presentation/common/state_render/states/loading_state.dart';
import 'package:flutter_app/presentation/common/state_render/states/state_renderer_type.dart';
import 'package:flutter_app/presentation/common/state_render/states/success_state.dart';
import 'package:flutter_app/presentation/forgot_password/viewmodel/forgot_password_viewmodel_inputs.dart';
import 'package:flutter_app/presentation/forgot_password/viewmodel/forgot_password_viewmodel_outputs.dart';
import '../../base/base_viewmodel.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInputs, ForgotPasswordViewModelOutputs {
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  ForgotPasswordViewModel(this._forgotPasswordUseCase);
  var email = "";

  @override
  void start() {
    // view model should tell view, please show content state
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.close();
    _areSentVerificationStreamController.close();
  }

  @override
  forgotPassword() async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.popupLoadingState),
    );
    (await _forgotPasswordUseCase.execute(email)).fold(
      (failure) {
        // left -> failure
        inputState.add(
          ErrorState(
            StateRendererType.popupErrorState,
            failure.message,
          ),
        );
        // _areSentVerificationStreamController.add(true);
      },
      (supportMessage) {
        // right -> success (data)
        inputState.add(
          SuccessState(supportMessage),
        );
        // _areSentVerificationStreamController.add(false);
      },
    );
  }

  @override
  resendVerification() => forgotPassword();

  // email
  final StreamController _emailController =
      StreamController<String>.broadcast();
  @override
  Sink get inputEmail => _emailController.sink;
  @override
  setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
    inputAreSentVerification.add(null);
  }

  @override
  Stream<bool> get outputIsEmailValid => _emailController.stream.map(
        (email) => isEmailValid(email),
      );

  // areSentVerification
  final StreamController _areSentVerificationStreamController =
      StreamController<void>.broadcast();
  @override
  Sink get inputAreSentVerification =>
      _areSentVerificationStreamController.sink;
  @override
  Stream<bool> get outputAreSentVerification =>
      _areSentVerificationStreamController.stream.map((_) => _);
}
