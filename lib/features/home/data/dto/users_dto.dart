import '../../domain/entities/users_entity.dart';

class UsersDto extends UsersEntity {
  UsersDto(super.email);

  factory UsersDto.fromJson(Map map) {
    return UsersDto(map['email']);
  }
}
