import '../../../../core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import '../../data/dto/orders_dto.dart';
import '../repositories/home_repository.dart';
import 'status_orders_usecase.dart';

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
