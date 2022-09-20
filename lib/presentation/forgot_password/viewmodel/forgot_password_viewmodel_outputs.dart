abstract class ForgotPasswordViewModelOutputs {
  // stream controller output
  Stream<bool> get outputIsEmailValid;
  Stream<bool> get outputAreSentVerification;
}
