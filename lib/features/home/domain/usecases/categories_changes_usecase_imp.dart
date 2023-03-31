import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/repositories/home_repository.dart';
import 'package:lojamanager/features/home/domain/usecases/categories_changes_usecase.dart';

class CategoriesChangesUseCaseImp implements CategoriesChangesUseCase {
  HomeRepository homeRepository;

  CategoriesChangesUseCaseImp(this.homeRepository);

  Future<Either<Failure, void>> categoriesChanges(
      // String image,
      String category,
      String id) {
    return homeRepository.categoriesChanges(
        // image,
        category,
        id);
  }
}
