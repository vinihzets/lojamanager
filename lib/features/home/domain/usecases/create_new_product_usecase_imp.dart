import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../repositories/home_repository.dart';
import 'create_new_product_usecase.dart';

class CreateNewProductUseCaseImp implements CreateNewProductUseCase {
  HomeRepository homeRepository;

  CreateNewProductUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, void>> createNewProduct(String description,
      String categoryID, List images, String name, String price, List sizes) {
    return homeRepository.createNewProduct(
        description, categoryID, images, name, price, sizes);
  }
}
