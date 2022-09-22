import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/common/state_render/states/state_renderer_type.dart';
import 'package:flutter_app/presentation/resources/other_managers/assets_manager.dart';
import 'package:flutter_app/presentation/resources/other_managers/color_manager.dart';
import 'package:flutter_app/presentation/resources/other_managers/strings_manager.dart';
import 'package:flutter_app/presentation/resources/other_managers/styles_manager.dart';
import 'package:flutter_app/presentation/resources/values_manager/app_padding.dart';
import 'package:flutter_app/presentation/resources/values_manager/app_size.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String message;
  String title;
  Function retryActionFunction;
  StateRenderer({
    super.key,
    required this.stateRendererType,
    this.message = AppStrings.loading,
    this.title = '',
    required this.retryActionFunction,
  });

  @override
  Widget build(BuildContext context) => _getStateWidget(context);

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopUpDialog(
          context,
          [_getAnimatedImage(JsonAssets.loading)],
        );
      case StateRendererType.popupErrorState:
        return _getPopUpDialog(
          context,
          [
            _getAnimatedImage(JsonAssets.error),
            _getMessage(message),
            _getRetryButton(AppStrings.ok, context),
          ],
        );
      case StateRendererType.popupSuccessState:
        return _getPopUpDialog(
          context,
          [
            _getAnimatedImage(JsonAssets.success),
            _getMessage(message),
            _getRetryButton(AppStrings.ok, context),
          ],
        );

      case StateRendererType.fullScreenLoadingState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.loading),
          _getMessage(message),
        ]);
      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.retryAgain, context)
        ]);
      case StateRendererType.fullScreenEmptyState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.empty),
          _getMessage(message),
          _getRetryButton(AppStrings.retryAgain, context)
        ]);
      case StateRendererType.contentState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.s14),
          boxShadow: const [BoxShadow(color: Colors.black26)],
        ),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getItemsColumn(List<Widget> children) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName), // todo add json image here
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message,
          style: getRegularStyle(
            color: ColorManager.black,
            fontSize: AppSize.s18,
          ),
        ),
      ),
    );
  }

  Widget _getRetryButton(String butonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (stateRendererType == StateRendererType.fullScreenErrorState) {
                // call retry action function
                retryActionFunction.call();
              } else {
                // popup error state
                Navigator.of(context).pop();
              }
            },
            child: Text(butonTitle),
          ),
        ),
      ),
    );
  }
}
