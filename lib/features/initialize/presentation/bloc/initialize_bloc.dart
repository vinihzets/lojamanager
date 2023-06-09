import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/archiceture/bloc_state.dart';
import '../../../../core/services/auth/auth_service.dart';
import '../../../../core/utils/hud_mixins.dart';
import '../../../../main.dart';
import 'initialize_bloc_event.dart';

class InitializeBloc with HudMixins {
  AuthService authService;

  late StreamController<BlocState> _state;
  Stream<BlocState> get state => _state.stream;

  late StreamController<InitializeBlocEvent> _event;
  Sink<InitializeBlocEvent> get event => _event.sink;

  InitializeBloc(this.authService) {
    _event = StreamController.broadcast();
    _state = StreamController.broadcast();

    _event.stream.listen(_mapListenEvent);
  }

  onSplashNavigate(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(gConsts.loginScreen, (route) => false);
  }

  dispatchEvent(InitializeBlocEvent event) {
    _event.add(event);
  }

  dispatchState(BlocState state) {
    _state.add(state);
  }

  _mapListenEvent(InitializeBlocEvent event) {
    if (event is InitializeBlocEventNavigate) {
      navigateRemoveUntil(event.context, event.routeName);
    }
  }

  authenticated(BuildContext context) {
    final auth = authService.auth;

    if (auth.currentUser != null) {
      _event.add(InitializeBlocEventNavigate(context, gConsts.homeScreen));
    } else {
      _event.add(InitializeBlocEventNavigate(context, gConsts.loginScreen));
    }
  }
}
