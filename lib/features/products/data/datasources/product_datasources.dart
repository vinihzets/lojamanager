import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';

abstract class ProductDataSources {
  Future<Either<Failure, void>> productModify(String name, String description,
      String price, String idCategories, String idProduct);
}
