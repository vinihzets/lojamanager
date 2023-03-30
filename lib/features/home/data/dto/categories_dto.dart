import 'package:lojamanager/features/home/domain/entities/categories_entity.dart';

class CategoriesDto extends CategoriesEntity {
  CategoriesDto(super.icon, super.id, super.name);

  factory CategoriesDto.fromJson(Map map) {
    return CategoriesDto(map['icon'], map['id'], map['name']);
  }
}
