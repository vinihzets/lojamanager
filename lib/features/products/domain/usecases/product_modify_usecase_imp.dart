import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/products/domain/repositories/product_repository.dart';
import 'package:lojamanager/features/products/domain/usecases/product_modify_usecase.dart';

class ProductModifyUseCaseImp implements ProductModifyUseCase {
  ProductRepository productRepository;

  ProductModifyUseCaseImp(this.productRepository);

  Future<Either<Failure, void>> productModify(String name, String description,
      String price, String idCategories, String idProduct) {
    return productRepository.productModify(
        name, description, price, idCategories, idProduct);
  }
}
