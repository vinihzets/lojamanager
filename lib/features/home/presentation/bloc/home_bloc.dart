import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:lojamanager/core/archiceture/bloc_state.dart';
import 'package:lojamanager/core/utils/hud_mixins.dart';
import 'package:lojamanager/features/home/domain/usecases/get_orders_usecase.dart';
import 'package:lojamanager/features/home/domain/usecases/get_users_usecase.dart';
import 'package:lojamanager/features/home/domain/usecases/sign_out_usecase.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_event.dart';
import 'package:lojamanager/main.dart';

class HomeBloc with HudMixins {
  SignOutUseCase signOutUseCase;
  GetUsersUseCase getUsersUseCase;
  GetOrdersUseCase getOrdersUseCase;

  late StreamController<BlocState> _state;
  Stream<BlocState> get state => _state.stream;

  late StreamController<HomeEvent> _event;
  Sink<HomeEvent> get event => _event.sink;

  late StreamController<BlocState> _stateOrders;
  Stream<BlocState> get stateOrders => _stateOrders.stream;

  late StreamController<HomeEvent> _eventOrders;
  Sink<HomeEvent> get eventOrders => _eventOrders.sink;

  HomeBloc(this.signOutUseCase, this.getUsersUseCase, this.getOrdersUseCase) {
    _event = StreamController.broadcast();
    _state = StreamController.broadcast();

    _eventOrders = StreamController.broadcast();
    _stateOrders = StreamController.broadcast();

    _event.stream.listen(_mapListenEvent);
  }

  dispatchOrdersEvent(HomeEvent event) {
    _eventOrders.add(event);
  }

  dispatchOrdersState(BlocState state) {
    _stateOrders.add(state);
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
    } else if (event is HomeEventGetOrders) {
      getOrders(event.context);
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

  getOrders(BuildContext context) async {
    final ordersRequest = await getOrdersUseCase.getOrders();
    ordersRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      dispatchOrdersState(BlocStableState(r));
    });
  }
}
