import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/common/state_render/content_state.dart';
import 'package:flutter_app/presentation/common/state_render/empty_state.dart';
import 'package:flutter_app/presentation/common/state_render/error_state.dart';
import 'package:flutter_app/presentation/common/state_render/flow_state.dart';
import 'package:flutter_app/presentation/common/state_render/loading_state.dart';
import 'package:flutter_app/presentation/common/state_render/state_renderer.dart';
import 'package:flutter_app/presentation/common/state_render/state_renderer_type.dart';

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
    BuildContext context,
    Widget contentScreenWidget,
    Function retryActionFunction,
  ) {
    switch (runtimeType) {
      case LoadingState:
        if (getStateRendererType() == StateRendererType.popupLoadingState) {
          // show popup loading
          showPopup(
            context,
            getStateRendererType(),
            getMessage(),
          );
          // show content screen
          return contentScreenWidget;
        } else {
          // show full screen loading
          return StateRenderer(
            stateRendererType: getStateRendererType(),
            message: getMessage(),
            retryActionFunction: retryActionFunction,
          );
        }
      case EmptyState:
        // show full screen empty
        return StateRenderer(
          stateRendererType: getStateRendererType(),
          message: getMessage(),
          retryActionFunction: () {},
        );

      case ErrorState:
        dismissDialog(context);
        if (getStateRendererType() == StateRendererType.popupErrorState) {
          // show popup error
          showPopup(
            context,
            getStateRendererType(),
            getMessage(),
          );
          // show content screen
          return contentScreenWidget;
        } else {
          // show full screen error
          return StateRenderer(
            stateRendererType: getStateRendererType(),
            message: getMessage(),
            retryActionFunction: retryActionFunction,
          );
        }
      case ContentState:
        // show full screen content
        dismissDialog(context);
        return contentScreenWidget;
      default:
        // show full screen content
        dismissDialog(context);
        return contentScreenWidget;
    }
  }

  _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent;

  dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  showPopup(BuildContext context, StateRendererType stateRendererType,
      String message) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return StateRenderer(
              stateRendererType: stateRendererType,
              message: message,
              retryActionFunction: () {},
            );
          },
        );
      },
    );
  }
}
