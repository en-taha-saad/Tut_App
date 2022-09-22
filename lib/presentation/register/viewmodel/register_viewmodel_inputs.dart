// inputs mean that "Orders" that our view model will receive from view
import 'dart:io';

abstract class RegisterViewModelInputs {
  setUserName(String username);
  setCountryCode(String countryCode);
  setMobileNumber(String mobileNumber);
  setEmail(String email);
  setPassword(String password);
  setProfilePicture(File profilePicture);

  register();

  Sink get inputUserName;
  Sink get inputMobileNumber;
  Sink get inputEmail;
  Sink get inputPassword;
  Sink get inputProfilePicture;
}
