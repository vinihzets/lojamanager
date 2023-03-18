import 'package:flutter/widgets.dart';

abstract class RegisterEntity {
  String email;
  String password;
  String? latitude;
  String? longitude;
  String? endereco;

  RegisterEntity({
    required this.endereco,
    required this.latitude,
    required this.longitude,
    required this.email,
    required this.password,
  });
}
