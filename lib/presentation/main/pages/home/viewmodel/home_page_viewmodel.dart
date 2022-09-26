import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/domain/models/home_models/homeview_object.dart';
import 'package:flutter_app/domain/usecase/home_usecase/home_usecase.dart';
import 'package:flutter_app/presentation/base/base_viewmodel.dart';
import 'package:flutter_app/presentation/common/state_render/states/content_state.dart';
import 'package:flutter_app/presentation/common/state_render/states/error_state.dart';
import 'package:flutter_app/presentation/common/state_render/states/loading_state.dart';
import 'package:flutter_app/presentation/common/state_render/states/state_renderer_type.dart';
import 'package:flutter_app/presentation/main/pages/home/viewmodel/home_viewmodel_input.dart';
import 'package:flutter_app/presentation/main/pages/home/viewmodel/home_viewmodel_output.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelInput, HomeViewModelOutput {
  final StreamController _homeViewObjectController =
      BehaviorSubject<HomeViewObject>();

  final HomeUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase);

  _getHomeData() async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState),
    );
    // ignore: void_checks
    (await _homeUseCase.execute(Void)).fold(
      (failure) {
        // left -> failure
        inputState.add(
          ErrorState(
            StateRendererType.fullScreenErrorState,
            failure.message,
          ),
        );
        debugPrint("failure = ${failure.message}");
      },
      (homeObject) {
        // right -> success (data)
        inputState.add(ContentState());
        inputHomeViewObject.add(HomeViewObject(
          homeObject.data?.banners ?? [],
          homeObject.data?.services ?? [],
          homeObject.data?.stores ?? [],
        ));
      },
    );
  }

  @override
  void start() {
    _getHomeData();
  }

  @override
  void dispose() {
    _homeViewObjectController.close();
    super.dispose();
  }

  @override
  Sink get inputHomeViewObject => _homeViewObjectController.sink;

  @override
  Stream<HomeViewObject> get outputHomeViewObject =>
      _homeViewObjectController.stream.map(
        (homeViewObject) => homeViewObject,
      );
}
