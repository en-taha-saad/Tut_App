import 'package:flutter_app/presentation/common/state_render/flow_state.dart';
import 'package:flutter_app/presentation/common/state_render/state_renderer_type.dart';

// empty state (full screen)
class EmptyState extends FlowState {
  String message;
  EmptyState(this.message);
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenEmptyState;
}
