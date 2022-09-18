// inputs mean that "Orders" that our view model will receive from view
abstract class LoginViewModelInputs {
  setUsername(String username);
  setPassword(String password);
  login();

  // stream controller input
  Sink get inputUsername;
  Sink get inputPassword;
  Sink get inputAreAllInputsValid;
}
