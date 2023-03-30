import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/data/dto/orders_dto.dart';
import 'package:lojamanager/features/home/domain/entities/categories_entity.dart';
import 'package:lojamanager/features/home/domain/entities/orders_entity.dart';
import 'package:lojamanager/features/home/domain/entities/products_categories_entity.dart';
import 'package:lojamanager/features/home/domain/entities/users_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, List<UsersEntity>>> getUsers();
  Future<Either<Failure, List<OrdersEntity>>> getOrders();
  Future<Either<Failure, void>> statusUp(OrdersDto ordersDto);
  Future<Either<Failure, void>> statusDown(OrdersDto ordersDto);
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
  Future<Either<Failure, List<ProductsCategoriesEntity>>> getCategoriesProducts(
      String id);
}
