import 'package:lojamanager/features/home/domain/entities/users_entity.dart';

class UsersDto extends UsersEntity {
  UsersDto(super.email, super.docId, super.userId);

  factory UsersDto.fromJson(Map map) {
    return UsersDto(map['email'], map['docId'], map['userId']);
  }
}
