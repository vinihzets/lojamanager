import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../repositories/home_repository.dart';
import 'categories_changes_usecase.dart';

class CategoriesChangesUseCaseImp implements CategoriesChangesUseCase {
  HomeRepository homeRepository;

  CategoriesChangesUseCaseImp(this.homeRepository);

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
}
