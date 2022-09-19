import 'package:flutter_app/app/constants.dart';
import 'package:flutter_app/presentation/common/state_render/flow_state.dart';
import 'package:flutter_app/presentation/common/state_render/state_renderer_type.dart';

// content state (full screen, popup)
class ContentState extends FlowState {
  ContentState();
  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}
