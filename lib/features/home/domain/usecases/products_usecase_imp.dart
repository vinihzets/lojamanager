import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../repositories/home_repository.dart';
import 'products_usecase.dart';

class ProductsUseCaseImp implements ProductsUseCase {
  HomeRepository homeRepository;

  ProductsUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, void>> removeProducts() {
    return homeRepository.removeProducts();
  }

  @override
  Future<Either<Failure, void>> createNewProduct(
      String description,
      String categoryID,
      List images,
      String name,
      String price,
      List sizes,
      DateTime createdAt,
      String productId) {
    return homeRepository.createNewProduct(description, categoryID, images,
        name, price, sizes, createdAt, productId);
  }
}
