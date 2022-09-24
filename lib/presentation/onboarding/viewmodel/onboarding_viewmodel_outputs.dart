import 'package:flutter_app/domain/models/onboarding_models/sliderviewobject.dart';

abstract class OnBoardingViewModelOutputs {
  // stream controller output
  Stream<SliderViewObject> get outputSliderViewObject;
}
