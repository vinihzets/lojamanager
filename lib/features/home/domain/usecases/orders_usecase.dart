import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/orders_entity.dart';

abstract class OrdersUseCase {
  Future<Either<Failure, List<OrdersEntity>>> getOrders();
}
