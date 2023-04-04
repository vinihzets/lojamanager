import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/entities/orders_entity.dart';
import 'package:lojamanager/features/home/domain/repositories/home_repository.dart';
import 'package:lojamanager/features/home/domain/usecases/get_orders_usecase.dart';

class GetOrdersUseCaseImp implements GetOrdersUseCase {
  HomeRepository repository;

  GetOrdersUseCaseImp(this.repository);

  @override
  Future<Either<Failure, List<OrdersEntity>>> getOrders() {
    return repository.getOrders();
  }
}
