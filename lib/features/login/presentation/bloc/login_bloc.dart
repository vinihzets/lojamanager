import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lojamanager/features/login/presentation/bloc/login_event.dart';
import 'package:lojamanager/features/login/presentation/bloc/login_state.dart';
import 'package:lojamanager/main.dart';

class LoginBloc {
  LoginBloc() {}

  late StreamController<LoginEvent> _event;
  Sink<LoginEvent> get event => _event.sink;

  late StreamController<LoginState> _state;
  Stream<LoginState> get state => _state.stream;

  onPressedNavigate(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(gConsts.registerScreen, (route) => false);
  }
}
