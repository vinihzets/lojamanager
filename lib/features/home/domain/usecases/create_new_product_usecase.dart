import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';

abstract class CreateNewProductUseCase {
  Future<Either<Failure, void>> createNewProduct(
      String description,
      String categoryID,
      String image,
      List images,
      String name,
      String price,
      List sizes);
}
