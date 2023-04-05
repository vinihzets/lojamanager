import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, void>> productModify(
    String name,
    String description,
    String price,
    String idCategories,
    String idProduct,
    List sizes,
    List images,
  );
  Future<Either<Failure, void>> productRemove(
      String idCategory, String productId);
}
