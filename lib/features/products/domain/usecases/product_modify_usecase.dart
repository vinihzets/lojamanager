import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';

abstract class ProductModifyUseCase {
  Future<Either<Failure, void>> productModify(String name, String description,
      String price, String idCategories, String idProduct);
}
