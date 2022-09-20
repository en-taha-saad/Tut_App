import 'package:flutter_app/app/dependency_injections/init_app_module.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecase/forgot_password_usecase/forgot_password_usecase.dart';
import 'package:flutter_app/presentation/forgot_password/viewmodel/forgot_password_viewmodel.dart';
import 'package:get_it/get_it.dart';

initForgotPasswordModule() {
  // ForgotPassword module, only ForgotPassword dependencies are here

  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    // ForgotPassword use case instance
    instance.registerFactory<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(instance<Repository>()),
    );
    // ForgotPassword view model instance
    instance.registerFactory<ForgotPasswordViewModel>(
      () => ForgotPasswordViewModel(instance<ForgotPasswordUseCase>()),
    );
  }
}
