import 'package:flutter/material.dart';

abstract class LoginEvent {}

class LoginEventSignIn implements LoginEvent {
  BuildContext context;
  String email;
  String password;

  LoginEventSignIn(this.context, this.email, this.password);
}
