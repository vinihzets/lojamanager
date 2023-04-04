import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';

class Params {
  String name;
  String description;
  String price;
  String idCategories;
  String idProduct;
  List sizes;
  List images;

  Params(this.name, this.description, this.price, this.idCategories,
      this.idProduct, this.sizes, this.images);
}

abstract class ProductModifyUseCase {
  Future<Either<Failure, void>> productModify(
    String name,
    String description,
    String price,
    String idCategories,
    String idProducts,
    List sizes,
    List images,
  );
}
