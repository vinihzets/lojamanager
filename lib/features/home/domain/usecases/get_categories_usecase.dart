import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/categories_entity.dart';

abstract class GetCategoriesUseCase {
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
}
