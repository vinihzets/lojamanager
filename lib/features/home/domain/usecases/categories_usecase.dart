import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/categories_entity.dart';
import '../entities/products_categories_entity.dart';

abstract class CategoriesUseCase {
  Future<Either<Failure, dynamic>> createNewCategory(
      String icon, String category);
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
  Future<Either<Failure, void>> categoriesChanges(String category, String id);

  Future<Either<Failure, void>> removeCategory(String id);
  Future<Either<Failure, List<ProductsCategoriesEntity>>> getCategoriesProducts(
      String id);
}
