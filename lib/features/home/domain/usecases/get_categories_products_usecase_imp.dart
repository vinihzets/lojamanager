import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/entities/products_categories_entity.dart';
import 'package:lojamanager/features/home/domain/repositories/home_repository.dart';
import 'package:lojamanager/features/home/domain/usecases/get_categories_products_usecase.dart';

class GetCategoriesProductsUseCaseImp implements GetCategoriesProductsUseCase {
  HomeRepository homeRepository;

  GetCategoriesProductsUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, List<ProductsCategoriesEntity>>> getCategoriesProducts(
      String id) {
    return homeRepository.getCategoriesProducts(id);
  }
}
