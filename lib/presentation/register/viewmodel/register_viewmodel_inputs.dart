// inputs mean that "Orders" that our view model will receive from view
abstract class RegisterViewModelInputs {
  setUserName(String username);
  setCountryMobileCode(String countryMobileCode);
  setMobileNumber(String mobileNumber);
  setEmail(String email);
  setPassword(String password);
  setProfilePicture(String profilePicture);

  register();

  // stream controller input
  Sink get inputAreAllInputsValid;
  Sink get inputUserName;
  Sink get inputCountryMobileCode;
  Sink get inputMobileNumber;
  Sink get inputEmail;
  Sink get inputPassword;
  Sink get inputProfilePicture;
}
