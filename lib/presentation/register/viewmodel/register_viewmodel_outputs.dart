abstract class RegisterViewModelOutputs {
  // stream controller output

  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsCountryMobileCodeValid;
  Stream<bool> get outputIsMobileNumberValid;
  Stream<bool> get outputIsEmailValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsProfilePictureValid;

  Stream<bool> get outputAreAllInputsValid;
}
