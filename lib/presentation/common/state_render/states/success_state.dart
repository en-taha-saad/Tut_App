import 'package:flutter_app/presentation/common/state_render/states/flow_state.dart';
import 'package:flutter_app/presentation/common/state_render/states/state_renderer_type.dart';

// error state (full screen, popup)
class SuccessState extends FlowState {
  String message;
  SuccessState(this.message);
  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.popupSuccessState;

  @override
  String getMessage() => message;
}
