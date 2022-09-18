abstract class LoginViewModelOutputs {
  // stream controller output
  Stream<bool> get outputIsUsernameValid;
  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputAreAllInputsValid;
}
