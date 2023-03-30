import 'package:lojamanager/features/home/domain/entities/products_categories_entity.dart';

class ProductsCategoriesDto extends ProductsCategoriesEntity {
  ProductsCategoriesDto(super.description, super.image, super.images,
      super.name, super.price, super.sizes);

  factory ProductsCategoriesDto.fromJson(Map map) {
    return ProductsCategoriesDto(map['description'], map['image'],
        map['images'], map['name'], map['price'], map['sizes']);
  }
}