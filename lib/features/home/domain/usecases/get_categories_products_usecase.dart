import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/entities/products_categories_entity.dart';

abstract class GetCategoriesProductsUseCase {
  Future<Either<Failure, List<ProductsCategoriesEntity>>> getCategoriesProducts(
      String id);
}
