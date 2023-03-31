import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/products/data/datasources/product_datasources.dart';
import 'package:lojamanager/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  ProductDataSources productDataSources;

  ProductRepositoryImp(this.productDataSources);

  Future<Either<Failure, void>> productModify(String name, String description,
      String price, String idCategories, String idProduct, List sizes) {
    return productDataSources.productModify(
        name, description, price, idCategories, idProduct, sizes);
  }
}
