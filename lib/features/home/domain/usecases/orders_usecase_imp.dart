import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/orders_entity.dart';
import '../repositories/home_repository.dart';
import 'orders_usecase.dart';

class OrdersUseCaseImp implements OrdersUseCase {
  HomeRepository repository;

  OrdersUseCaseImp(this.repository);

  @override
  Future<Either<Failure, List<OrdersEntity>>> getOrders() {
    return repository.getOrders();
  }
}
