import 'package:flutter_app/presentation/common/state_render/states/flow_state.dart';
import 'package:flutter_app/presentation/common/state_render/states/state_renderer_type.dart';

// error state (full screen, popup)
class SuccessState extends FlowState {
  StateRendererType stateRendererType;
  String message;
  SuccessState(this.stateRendererType, this.message);
  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  String getMessage() => message;
}
