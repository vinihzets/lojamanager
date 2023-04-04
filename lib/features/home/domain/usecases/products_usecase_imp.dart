import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/repositories/home_repository.dart';
import 'package:lojamanager/features/home/domain/usecases/products_usecase.dart';

class ProductsUseCaseImp implements ProductsUseCase {
  HomeRepository homeRepository;

  ProductsUseCaseImp(this.homeRepository);

  Future<Either<Failure, void>> removeProducts() {
    return homeRepository.removeProducts();
  }
}
