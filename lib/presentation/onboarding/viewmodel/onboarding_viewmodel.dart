import 'dart:async';

import 'package:flutter_app/domain/models/onboarding/sliderobject.dart';
import 'package:flutter_app/domain/models/onboarding/sliderviewobject.dart';
import 'package:flutter_app/presentation/onboarding/viewmodel/onboarding_viewmodel_inputs.dart';
import 'package:flutter_app/presentation/onboarding/viewmodel/onboarding_viewmodel_outputs.dart';
import 'package:flutter_app/presentation/resources/other_managers/assets_manager.dart';
import 'package:flutter_app/presentation/resources/other_managers/strings_manager.dart';

import '../../base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controllers outputs
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  int _currentIndex = 0;

  late final List<SliderObject> _list;

  //OnBoarding ViewModel Inputs
  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  @override
  void start() {
    // viewmodel start your job
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  //OnBoarding ViewModel inputs
  @override
  Sink get inputSliderViewObject => _streamController.sink;

  //OnBoarding ViewModel outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject {
    return _streamController.stream.map(
      (sliderViewObject) => sliderViewObject,
    );
  }

  // onboarding private functions
  List<SliderObject> _getSliderData() => [
        SliderObject(
          AppStrings.onBoardingTitle1,
          AppStrings.onBoardingSubTitle1,
          ImageAssets.onboardingLogo1,
        ),
        SliderObject(
          AppStrings.onBoardingTitle2,
          AppStrings.onBoardingSubTitle2,
          ImageAssets.onboardingLogo2,
        ),
        SliderObject(
          AppStrings.onBoardingTitle3,
          AppStrings.onBoardingSubTitle3,
          ImageAssets.onboardingLogo3,
        ),
        SliderObject(
          AppStrings.onBoardingTitle4,
          AppStrings.onBoardingSubTitle4,
          ImageAssets.onboardingLogo4,
        ),
      ];

  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        _list[_currentIndex],
        _list.length,
        _currentIndex,
      ),
    );
  }
}
