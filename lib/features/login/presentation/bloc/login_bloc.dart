import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojamanager/core/archiceture/bloc_state.dart';
import 'package:lojamanager/core/services/auth/auth_service.dart';
import 'package:lojamanager/core/utils/hud_mixins.dart';
import 'package:lojamanager/features/login/domain/usecases/sign_in_usecase.dart';
import 'package:lojamanager/features/login/presentation/bloc/login_event.dart';
import 'package:lojamanager/main.dart';

class LoginBloc with HudMixins {
  SignInUseCase signInUseCase;
  AuthService authService;

  LoginBloc(this.signInUseCase, this.authService) {
    _event = StreamController();
    _state = StreamController();

    _event.stream.listen(_mapListenEvent);
  }

  late StreamController<LoginEvent> _event;
  Sink<LoginEvent> get event => _event.sink;

  late StreamController<BlocState> _state;
  Stream<BlocState> get state => _state.stream;

  dispatchEvent(LoginEvent event) {
    _event.add(event);
  }

  dispatchState(BlocState state) {
    _state.add(state);
  }

  _mapListenEvent(LoginEvent event) {
    if (event is LoginEventSignIn) {
      signIn(event.context, event.email, event.password);
    }
  }

  signIn(BuildContext context, String email, String password) async {
    final loginRequest = await signInUseCase.signIn(email, password);

    loginRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      verifyCredential(context);
    });
  }

  verifyCredential(BuildContext context) {
    return FirebaseFirestore.instance
        .collection('admins')
        .doc(authService.auth.currentUser!.uid)
        .get()
        .then((value) {
      if (value.data() != null) {
        navigateRemoveUntil(context, gConsts.homeScreen);
      } else {
        showSnack(context, 'Esse usuario nao possui acesso de administrador');
      }
    });
  }
}
