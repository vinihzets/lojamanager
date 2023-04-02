import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/data/datasources/home_datasources.dart';
import 'package:lojamanager/features/home/data/dto/orders_dto.dart';
import 'package:lojamanager/features/home/domain/entities/categories_entity.dart';
import 'package:lojamanager/features/home/domain/entities/orders_entity.dart';
import 'package:lojamanager/features/home/domain/entities/products_categories_entity.dart';
import 'package:lojamanager/features/home/domain/entities/users_entity.dart';
import 'package:lojamanager/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  HomeDataSources homeDataSources;

  HomeRepositoryImp(this.homeDataSources);

  @override
  Future<Either<Failure, void>> signOut() {
    return homeDataSources.signOut();
  }

  @override
  Future<Either<Failure, List<UsersEntity>>> getUsers() {
    return homeDataSources.getUsers();
  }

  @override
  Future<Either<Failure, List<OrdersEntity>>> getOrders() {
    return homeDataSources.getOrders();
  }

  @override
  Future<Either<Failure, void>> statusDown(OrdersDto ordersDto) {
    return homeDataSources.statusDown(ordersDto);
  }

  @override
  Future<Either<Failure, void>> statusUp(OrdersDto ordersDto) {
    return homeDataSources.statusUp(ordersDto);
  }

  @override
  Future<Either<Failure, List<CategoriesEntity>>> getCategories() {
    return homeDataSources.getCategories();
  }

  @override
  Future<Either<Failure, List<ProductsCategoriesEntity>>> getCategoriesProducts(
      String id) {
    return homeDataSources.getProductsCategories(id);
  }

  @override
  Future<Either<Failure, void>> categoriesChanges(
      // String image,
      String category,
      String id) {
    return homeDataSources.categoriesChanges(
        // image,
        category,
        id);
  }

  @override
  Future<Either<Failure, dynamic>> createNewCategory(
      String icon, String category) {
    return homeDataSources.createNewCategory(icon, category);
  }
}
