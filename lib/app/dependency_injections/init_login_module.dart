import 'package:flutter_app/app/dependency_injections/init_app_module.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecase/login_usecase/login_usecase.dart';
import 'package:flutter_app/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:get_it/get_it.dart';

initLoginModule() {
  // login module, only login dependencies are here

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    // login use case instance
    instance.registerFactory<LoginUseCase>(
      () => LoginUseCase(instance<Repository>()),
    );
    // login view model instance
    instance.registerFactory<LoginViewModel>(
      () => LoginViewModel(instance<LoginUseCase>()),
    );
  }
}
