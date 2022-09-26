import 'package:flutter_app/domain/models/home_models/homeview_object.dart';

abstract class HomeViewModelOutput {
  Stream<HomeViewObject> get outputHomeViewObject;
}
