abstract class ForgotPasswordViewModelInputs {
  setEmail(String email);
  forgotPassword();
  resendVerification();

  // stream controller input
  Sink get inputEmail;
  Sink get inputAreSentVerification;
}
