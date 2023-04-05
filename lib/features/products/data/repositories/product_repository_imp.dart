import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../datasources/product_datasources.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  ProductDataSources productDataSources;

  ProductRepositoryImp(this.productDataSources);

  @override
  Future<Either<Failure, void>> productModify(
    String name,
    String description,
    String price,
    String idCategories,
    String idProduct,
    List sizes,
    List images,
  ) {
    return productDataSources.productModify(
      name,
      description,
      price,
      idCategories,
      idProduct,
      sizes,
      images,
    );
  }

  @override
  Future<Either<Failure, void>> productRemove(
      String idCategory, String productId) {
    return productDataSources.productRemove(idCategory, productId);
  }
}
