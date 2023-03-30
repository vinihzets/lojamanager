import 'package:lojamanager/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:lojamanager/features/home/data/dto/orders_dto.dart';
import 'package:lojamanager/features/home/domain/entities/orders_entity.dart';
import 'package:lojamanager/features/home/domain/repositories/home_repository.dart';
import 'package:lojamanager/features/home/domain/usecases/status_orders_usecase.dart';

class StatusOrderUseCaseImp implements StatusOrderUseCase {
  HomeRepository repository;

  StatusOrderUseCaseImp(this.repository);

  @override
  Future<Either<Failure, void>> statusDown(OrdersDto ordersDto) {
    return repository.statusDown(ordersDto);
  }

  @override
  Future<Either<Failure, void>> statusUp(OrdersDto ordersDto) {
    return repository.statusUp(ordersDto);
  }
}
