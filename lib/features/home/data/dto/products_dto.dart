import 'package:lojamanager/features/home/domain/entities/products_entity.dart';

class ProductsDto extends ProductsEntity {
  ProductsDto(super.image, super.name, super.price, super.quantity, super.size);

  factory ProductsDto.fromJson(Map map) {
    return ProductsDto(
        map['image'], map['name'], map['price'], map['quantity'], map['size']);
  }
}
