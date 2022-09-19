import 'dart:async';

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
  Stream get outputState => _inputStreamController.stream.map(
        (flowState) => flowState,
      );
}

abstract class BaseViewModelInputs {
  void start(); // start view model job

  void dispose(); // will be called when view model dies

  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  // will be implemented later

  Stream get outputState;
}
