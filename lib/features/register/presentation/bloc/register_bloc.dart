import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/register/domain/entities/register_entity.dart';
import 'package:lojamanager/features/register/domain/usecases/register_usecase.dart';
import 'package:lojamanager/features/register/presentation/bloc/register_bloc_event.dart';
import 'package:lojamanager/features/register/presentation/bloc/register_bloc_state.dart';
import 'package:lojamanager/main.dart';

class RegisterBloc {
  RegisterUseCase registerUseCase;

  RegisterBloc(this.registerUseCase) {
    _event = StreamController.broadcast();
    _stream = StreamController.broadcast();

    _event.stream.listen(_eventSendState);
  }

  late StreamController<RegisterBlocState> _stream;
  Stream<RegisterBlocState> get stream => _stream.stream;

  late StreamController<RegisterBlocEvent> _event;
  Sink<RegisterBlocEvent> get event => _event.sink;

  signUp(BuildContext context, String email, String password) async {
    final requestRegister = await registerUseCase.register(email, password);

    requestRegister.fold((l) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l.message)));
    }, (r) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registrado com Sucesso')));
      Navigator.of(context)
          .pushNamedAndRemoveUntil(gConsts.loginScreen, (route) => false);
    });
  }

  _eventSendState(RegisterBlocEvent event) {
    if (event is RegisterTryEvent) {
      signUp(event.context, event.entity.email, event.entity.password);
    }
  }
}
