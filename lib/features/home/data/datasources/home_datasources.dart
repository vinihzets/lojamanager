import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/categories_entity.dart';
import '../../domain/entities/orders_entity.dart';
import '../../domain/entities/products_categories_entity.dart';
import '../../domain/entities/users_entity.dart';
import '../dto/orders_dto.dart';

abstract class HomeDataSources {
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, List<UsersEntity>>> getUsers();
  Future<Either<Failure, List<OrdersEntity>>> getOrders();
  Future<Either<Failure, void>> statusDown(OrdersDto ordersDto);
  Future<Either<Failure, void>> statusUp(OrdersDto ordersDto);
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
  Future<Either<Failure, List<ProductsCategoriesEntity>>> getProductsCategories(
      String id);
  Future<Either<Failure, void>> categoriesChanges(
      // String image,
      String category,
      String id);
  Future<Either<Failure, dynamic>> createNewCategory(
      String icon, String category);
  Future<Either<Failure, void>> removeCategory(String id);
  Future<Either<Failure, void>> createNewProduct(
      String description,
      String categoryID,
      List images,
      String name,
      String price,
      List sizes,
      DateTime createdAt);
  Future<Either<Failure, void>> removeProducts();
}
