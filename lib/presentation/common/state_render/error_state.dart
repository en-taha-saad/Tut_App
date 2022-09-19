import 'package:flutter_app/presentation/common/state_render/flow_state.dart';
import 'package:flutter_app/presentation/common/state_render/state_renderer_type.dart';

// error state (full screen, popup)
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;
  ErrorState(this.stateRendererType, this.message);
  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  String getMessage() => message;
}
