import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/data/dto/orders_dto.dart';
import 'package:lojamanager/features/home/domain/entities/orders_entity.dart';

abstract class StatusOrderUseCase {
  Future<Either<Failure, void>> statusUp(OrdersDto ordersDto);
  Future<Either<Failure, void>> statusDown(OrdersDto ordersDto);
}
