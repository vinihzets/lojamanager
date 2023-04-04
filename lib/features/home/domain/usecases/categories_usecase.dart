import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/entities/categories_entity.dart';
import 'package:lojamanager/features/home/domain/entities/products_categories_entity.dart';

abstract class CategoriesUseCase {
  Future<Either<Failure, dynamic>> createNewCategory(
      String icon, String category);
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
  Future<Either<Failure, void>> categoriesChanges(String category, String id);

  Future<Either<Failure, void>> removeCategory(String id);
}
