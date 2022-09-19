import 'package:flutter_app/app/dependency_injections/init_app_module.dart';
import 'package:flutter_app/domain/usecase/login_usecase/login_usecase.dart';
import 'package:flutter_app/presentation/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:get_it/get_it.dart';

initOnboardingModule() {
  // onBoarding module, only onBoarding dependencies are here

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    // onBoarding view model instance
    instance.registerFactory<OnBoardingViewModel>(() => OnBoardingViewModel());
  }
}
