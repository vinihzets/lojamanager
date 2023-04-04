import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/products_categories_entity.dart';

abstract class GetCategoriesProductsUseCase {
  Future<Either<Failure, List<ProductsCategoriesEntity>>> getCategoriesProducts(
      String id);
}
