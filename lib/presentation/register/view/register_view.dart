import 'package:flutter/material.dart';
import 'package:flutter_app/app/dependency_injections/init_app_module.dart';
import 'package:flutter_app/presentation/common/state_render/states/flow_state.dart';
import 'package:flutter_app/presentation/register/viewmodel/register_viewmodel.dart';
import 'package:flutter_app/presentation/common/state_render/states/flow_state_extension.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _viewModel = instance<RegisterViewModel>();

  _bind() {
    _viewModel.start();
  }

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
    return Container();
  }
}
