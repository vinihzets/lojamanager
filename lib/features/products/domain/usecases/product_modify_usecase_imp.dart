import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../repositories/product_repository.dart';
import 'product_modify_usecase.dart';

class ProductModifyUseCaseImp implements ProductModifyUseCase {
  ProductRepository productRepository;

  ProductModifyUseCaseImp(this.productRepository);

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
    return productRepository.productModify(
      name,
      description,
      price,
      idCategories,
      idProduct,
      sizes,
      images,
    );
  }
}
