import 'package:lojamanager/features/home/data/dto/products_dto.dart';
import 'package:lojamanager/features/home/domain/entities/orders_entity.dart';

class OrdersDto extends OrdersEntity {
  OrdersDto(super.totalPrice, super.status, super.products);

  factory OrdersDto.fromJson(Map map) {
    return OrdersDto(map['totalPrice'], map['status'],
        (map['products'] as List).map((e) => ProductsDto.fromJson(e)).toList());
  }
}
