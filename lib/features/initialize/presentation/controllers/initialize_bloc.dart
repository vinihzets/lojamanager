import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lojamanager/core/archiceture/bloc.dart';
import 'package:lojamanager/features/initialize/presentation/controllers/initialize_bloc_event.dart';
import 'package:lojamanager/features/initialize/presentation/controllers/initialize_bloc_state.dart';
import 'package:lojamanager/main.dart';

class InitializeBloc {
  // Bloc bloc;

  // InitializeBloc(this.bloc);

  onSplashNavigate(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(gConsts.loginScreen, (route) => false);
  }
}
