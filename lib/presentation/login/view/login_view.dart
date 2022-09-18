import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/login/viewmodel/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = LoginViewModel(_loginUseCase);

  _bind() {
    _viewModel.start();
    _userNameController.addListener(() {
      _viewModel.setUsername(_userNameController.text);
    });
    _userPasswordController.addListener(() {
      _viewModel.setPassword(_userPasswordController.text);
    });
  }

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
