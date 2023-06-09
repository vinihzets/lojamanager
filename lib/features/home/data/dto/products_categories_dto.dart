import '../../domain/entities/products_categories_entity.dart';

class ProductsCategoriesDto extends ProductsCategoriesEntity {
  ProductsCategoriesDto(super.description, super.images, super.name,
      super.price, super.sizes, super.idCategory, super.id);

  factory ProductsCategoriesDto.fromJson(Map map) {
    return ProductsCategoriesDto(map['description'], map['images'], map['name'],
        map['price'], map['sizes'], map['categoryId'], map['productId']);
  }
}
