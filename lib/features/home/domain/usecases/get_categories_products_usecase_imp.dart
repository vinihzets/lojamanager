import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/products_categories_entity.dart';
import '../repositories/home_repository.dart';
import 'get_categories_products_usecase.dart';

class GetCategoriesProductsUseCaseImp implements GetCategoriesProductsUseCase {
  HomeRepository homeRepository;

  GetCategoriesProductsUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, List<ProductsCategoriesEntity>>> getCategoriesProducts(
      String id) {
    return homeRepository.getCategoriesProducts(id);
  }
}
