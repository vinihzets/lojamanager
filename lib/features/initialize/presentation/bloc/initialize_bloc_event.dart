import 'package:flutter/material.dart';

abstract class InitializeBlocEvent {}

class InitializeBlocEventNavigate implements InitializeBlocEvent {
  BuildContext context;
  String routeName;

  InitializeBlocEventNavigate(this.context, this.routeName);
}
