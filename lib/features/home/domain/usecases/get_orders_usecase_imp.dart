import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/orders_entity.dart';
import '../repositories/home_repository.dart';
import 'get_orders_usecase.dart';

class GetOrdersUseCaseImp implements GetOrdersUseCase {
  HomeRepository repository;

  GetOrdersUseCaseImp(this.repository);

  @override
  Future<Either<Failure, List<OrdersEntity>>> getOrders() {
    return repository.getOrders();
  }
}
