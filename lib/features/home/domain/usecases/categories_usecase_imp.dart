import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/entities/categories_entity.dart';
import 'package:lojamanager/features/home/domain/entities/products_categories_entity.dart';
import 'package:lojamanager/features/home/domain/repositories/home_repository.dart';
import 'package:lojamanager/features/home/domain/usecases/categories_usecase.dart';

class CategoriesUseCaseImp implements CategoriesUseCase {
  HomeRepository homeRepository;

  CategoriesUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, dynamic>> createNewCategory(
      String icon, String category) {
    return homeRepository.createNewCategory(icon, category);
  }

  @override
  Future<Either<Failure, List<CategoriesEntity>>> getCategories() {
    return homeRepository.getCategories();
  }

  @override
  Future<Either<Failure, void>> categoriesChanges(
      // String image,
      String category,
      String id) {
    return homeRepository.categoriesChanges(
        // image,
        category,
        id);
  }

  @override
  Future<Either<Failure, void>> removeCategory(String id) {
    return homeRepository.removeCategory(id);
  }

  @override
  Future<Either<Failure, List<ProductsCategoriesEntity>>> getCategoriesProducts(
      String id) {
    return homeRepository.getCategoriesProducts(id);
  }
}
