import 'package:lojamanager/features/home/data/dto/products_dto.dart';

class OrdersEntity {
  num totalPrice;
  int status;
  List<ProductsDto> products;
  String orderId;
  String user;

  OrdersEntity(
      this.totalPrice, this.status, this.products, this.orderId, this.user);
}
