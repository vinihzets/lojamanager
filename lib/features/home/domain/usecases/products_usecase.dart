import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';

abstract class ProductsUseCase {
  Future<Either<Failure, void>> removeProducts();
  Future<Either<Failure, void>> createNewProduct(
      String description,
      String categoryID,
      List images,
      String name,
      String price,
      List sizes,
      DateTime createdAt);
}
