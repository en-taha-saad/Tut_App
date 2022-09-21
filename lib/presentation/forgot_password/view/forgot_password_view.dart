import 'package:flutter/material.dart';
import 'package:flutter_app/app/dependency_injections/init_app_module.dart';
import 'package:flutter_app/presentation/common/state_render/states/flow_state.dart';
import 'package:flutter_app/presentation/forgot_password/viewmodel/forgot_password_viewmodel.dart';
import 'package:flutter_app/presentation/common/state_render/states/flow_state_extension.dart';
import 'package:flutter_app/presentation/resources/other_managers/assets_manager.dart';
import 'package:flutter_app/presentation/resources/other_managers/color_manager.dart';
import 'package:flutter_app/presentation/resources/other_managers/strings_manager.dart';
import 'package:flutter_app/presentation/resources/values_manager/app_padding.dart';
import 'package:flutter_app/presentation/resources/values_manager/app_size.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ForgotPasswordViewModel _viewModel =
      instance<ForgotPasswordViewModel>();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _emailController.addListener(
      () {
        _viewModel.setEmail(_emailController.text);
      },
    );
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _viewModel.outputState,
      builder: (context, AsyncSnapshot<FlowState> snapshot) {
        return snapshot.data?.getScreenWidget(
              context,
              _getContentWidget(),
              () {},
            ) ??
            _getContentWidget();
      },
    );
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(top: AppPadding.p100),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Center(
                  child: Image(
                    image: AssetImage(ImageAssets.splashLogo),
                  ),
                ),
                const SizedBox(height: AppSize.s28),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsEmailValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: AppStrings.email,
                          labelText: AppStrings.email,
                          errorText: (snapshot.data ?? true)
                              ? null
                              : AppStrings.emailError,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSize.s28),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsEmailValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () => _viewModel.forgotPassword()
                              : null,
                          child: const Text(AppStrings.resetPassword),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppPadding.p8,
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StreamBuilder<bool>(
                        stream: _viewModel.outputAreSentVerification,
                        builder: (context, snapshot) {
                          return TextButton(
                            onPressed: (snapshot.data ?? false)
                                ? () => _viewModel.resendVerification()
                                : null,
                            child: Text(
                              AppStrings.resendVerification,
                              style: (snapshot.data ?? false)
                                  ? Theme.of(context).textTheme.titleMedium
                                  : Theme.of(context).textTheme.bodyLarge,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
