import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../data/dto/orders_dto.dart';

abstract class StatusOrderUseCase {
  Future<Either<Failure, void>> statusUp(OrdersDto ordersDto);
  Future<Either<Failure, void>> statusDown(OrdersDto ordersDto);
}
