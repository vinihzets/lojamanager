import 'package:lojamanager/features/register/domain/entities/register_entity.dart';

class RegisterDto extends RegisterEntity {
  RegisterDto(
      {required super.endereco,
      required super.latitude,
      required super.longitude,
      required super.email,
      required super.password});

  factory RegisterDto.fromJson(Map map) {
    return RegisterDto(
        endereco: map['endereco'],
        latitude: map['latitude'],
        longitude: map['longitude'],
        email: map['email'],
        password: map['password']);
  }

  toMap() {
    return {
      'endereco': endereco,
      'latitude': latitude,
      'longitude': longitude,
      'email': email,
      'password': password,
    };
  }
}
