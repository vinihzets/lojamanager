import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/entities/categories_entity.dart';

abstract class GetCategoriesUseCase {
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
}
