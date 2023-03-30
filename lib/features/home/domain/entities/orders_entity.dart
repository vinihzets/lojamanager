import 'package:lojamanager/features/home/data/dto/products_dto.dart';
import 'package:lojamanager/features/home/domain/entities/products_entity.dart';

class OrdersEntity {
  num totalPrice;
  int status;
  List<ProductsDto> products;
  String orderId;
  String user;

  OrdersEntity(
      this.totalPrice, this.status, this.products, this.orderId, this.user);
}
