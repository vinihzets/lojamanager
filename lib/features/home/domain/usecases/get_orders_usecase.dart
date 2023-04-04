import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/entities/orders_entity.dart';

abstract class GetOrdersUseCase {
  Future<Either<Failure, List<OrdersEntity>>> getOrders();
}
