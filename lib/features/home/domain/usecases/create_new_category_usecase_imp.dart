import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../repositories/home_repository.dart';
import 'create_new_category_usecase.dart';

class CreateNewCategoryUseCaseImp implements CreateNewCategoryUseCase {
  HomeRepository homeRepository;

  CreateNewCategoryUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, dynamic>> createNewCategory(
      String icon, String category) {
    return homeRepository.createNewCategory(icon, category);
  }
}
