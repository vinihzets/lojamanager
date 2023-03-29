import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:lojamanager/core/archiceture/bloc_state.dart';
import 'package:lojamanager/core/utils/hud_mixins.dart';
import 'package:lojamanager/features/home/domain/usecases/get_users_usecase.dart';
import 'package:lojamanager/features/home/domain/usecases/sign_out_usecase.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_event.dart';
import 'package:lojamanager/main.dart';

class HomeBloc with HudMixins {
  SignOutUseCase signOutUseCase;
  GetUsersUseCase getUsersUseCase;

  late StreamController<BlocState> _state;
  Stream<BlocState> get state => _state.stream;

  late StreamController<HomeEvent> _event;
  Sink<HomeEvent> get event => _event.sink;

  HomeBloc(this.signOutUseCase, this.getUsersUseCase) {
    _event = StreamController.broadcast();
    _state = StreamController.broadcast();

    _event.stream.listen(_mapListenEvent);
  }

  dispatchEvent(HomeEvent event) {
    _event.add(event);
  }

  dispatchState(BlocState state) {
    _state.add(state);
  }

  _mapListenEvent(HomeEvent event) {
    if (event is HomeEventNavigate) {
      navigateRemoveUntil(event.context, event.routeName);
    } else if (event is HomeEventGetUsers) {
      getUsers(event.context);
    }
  }

  logOut(BuildContext context) async {
    final logoutRequest = await signOutUseCase.signOut();

    logoutRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      dispatchEvent(HomeEventNavigate(context, gConsts.loginScreen));
    });
  }

  getUsers(BuildContext context) async {
    final usersRequest = await getUsersUseCase.getUsers();
    usersRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      dispatchState(BlocStableState(r));
    });
  }
}
