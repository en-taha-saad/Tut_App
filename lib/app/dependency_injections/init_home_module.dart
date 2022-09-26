import 'package:flutter_app/app/dependency_injections/init_app_module.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecase/home_usecase/home_usecase.dart';
import 'package:flutter_app/presentation/main/pages/home/viewmodel/home_page_viewmodel.dart';
import 'package:get_it/get_it.dart';

initHomeModule() {
  // home module, only login dependencies are here

  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    // home use case instance
    instance.registerFactory<HomeUseCase>(
      () => HomeUseCase(instance<Repository>()),
    );
    // home view model instance
    instance.registerFactory<HomeViewModel>(
      () => HomeViewModel(instance<HomeUseCase>()),
    );
  }
}
