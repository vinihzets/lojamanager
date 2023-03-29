import 'package:flutter/material.dart';

abstract class HomeEvent {}

class HomeEventNavigate implements HomeEvent {
  BuildContext context;

  String routeName;

  HomeEventNavigate(this.context, this.routeName);
}

class HomeEventGetUsers implements HomeEvent {
  BuildContext context;

  HomeEventGetUsers(this.context);
}
