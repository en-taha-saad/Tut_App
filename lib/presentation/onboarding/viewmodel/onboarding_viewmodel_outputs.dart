import 'package:flutter_app/domain/models/onboarding/sliderviewobject.dart';

abstract class OnBoardingViewModelOutputs {
  // stream controller output
  Stream<SliderViewObject> get outputSliderViewObject;
}
