import 'package:flutter_app/app/dependency_injections/init_app_module.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:flutter_app/domain/usecase/register_usecase/register_usecase.dart';
import 'package:flutter_app/presentation/register/viewmodel/register_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

initRegisterModule() {
  // login module, only login dependencies are here

  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    // login use case instance
    instance.registerFactory<RegisterUseCase>(
      () => RegisterUseCase(instance<Repository>()),
    );
    // login view model instance
    instance.registerFactory<RegisterViewModel>(
      () => RegisterViewModel(instance<RegisterUseCase>()),
    );
    instance.registerFactory<ImagePicker>(() => ImagePicker());
  }
}
