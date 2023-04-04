import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/orders_entity.dart';

abstract class GetOrdersUseCase {
  Future<Either<Failure, List<OrdersEntity>>> getOrders();
}
