import 'package:lojamanager/features/home/domain/entities/products_entity.dart';

class OrdersEntity {
  num totalPrice;
  int status;
  List<ProductsEntity> products;

  OrdersEntity(this.totalPrice, this.status, this.products);
}
