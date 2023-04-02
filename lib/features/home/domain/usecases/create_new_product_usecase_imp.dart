import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/repositories/home_repository.dart';
import 'package:lojamanager/features/home/domain/usecases/create_new_product_usecase.dart';

class CreateNewProductUseCaseImp implements CreateNewProductUseCase {
  HomeRepository homeRepository;

  CreateNewProductUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, void>> createNewProduct(
      String description,
      String categoryID,
      String image,
      List images,
      String name,
      String price,
      List sizes) {
    return homeRepository.createNewProduct(
        description, categoryID, image, images, name, price, sizes);
  }
}
