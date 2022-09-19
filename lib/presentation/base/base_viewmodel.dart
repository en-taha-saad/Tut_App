import 'dart:async';

import 'package:flutter_app/presentation/base/base_viewmodel_outputs.dart';
import 'package:flutter_app/presentation/base/base_viewmodel_inputs.dart';
import 'package:flutter_app/presentation/common/state_render/states/flow_state.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // shared variables and function that will be used through any view model.
  final StreamController _inputStreamController =
      StreamController<FlowState>.broadcast();

  @override
  void dispose() {
    _inputStreamController.close();
  }

  @override
  Sink get inputState => _inputStreamController.sink;

  @override
  Stream<FlowState> get outputState => _inputStreamController.stream.map(
        (flowState) => flowState,
      );
}
