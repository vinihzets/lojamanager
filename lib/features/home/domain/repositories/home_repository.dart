import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../data/dto/orders_dto.dart';
import '../entities/categories_entity.dart';
import '../entities/orders_entity.dart';
import '../entities/products_categories_entity.dart';
import '../entities/users_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, List<UsersEntity>>> getUsers();
  Future<Either<Failure, List<OrdersEntity>>> getOrders();
  Future<Either<Failure, void>> statusUp(OrdersDto ordersDto);
  Future<Either<Failure, void>> statusDown(OrdersDto ordersDto);
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
  Future<Either<Failure, List<ProductsCategoriesEntity>>> getCategoriesProducts(
      String id);
  Future<Either<Failure, void>> categoriesChanges(
      // String image,
      String category,
      String id);
  Future<Either<Failure, dynamic>> createNewCategory(
      String icon, String category);
  Future<Either<Failure, void>> removeCategory(String id);
  Future<Either<Failure, void>> createNewProduct(String description,
      String categoryID, List images, String name, String price, List sizes);
}
