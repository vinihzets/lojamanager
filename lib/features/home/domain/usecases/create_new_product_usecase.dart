import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';

abstract class CreateNewProductUseCase {
  Future<Either<Failure, void>> createNewProduct(String description,
      String categoryID, List images, String name, String price, List sizes);
}
