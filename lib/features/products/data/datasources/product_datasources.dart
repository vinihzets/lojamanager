import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';

abstract class ProductDataSources {
  Future<Either<Failure, void>> productModify(
    String name,
    String description,
    String price,
    String idCategories,
    String idProduct,
    List sizes,
    List images,
  );
}
