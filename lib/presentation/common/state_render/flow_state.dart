import 'package:flutter_app/presentation/common/state_render/state_renderer_type.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}
