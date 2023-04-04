import 'products_dto.dart';
import '../../domain/entities/orders_entity.dart';

class OrdersDto extends OrdersEntity {
  OrdersDto(super.totalPrice, super.status, super.products, super.orderId,
      super.user, super.discount);

  factory OrdersDto.fromJson(Map map) {
    return OrdersDto(
        map['totalPrice'],
        map['status'],
        (map['products'] as List).map((e) => ProductsDto.fromJson(e)).toList(),
        map['orderId'],
        map['user'],
        map['discount']);
  }

  toMap() {
    return {
      'status': status,
    };
  }
}
