import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/repositories/home_repository.dart';
import 'package:lojamanager/features/home/domain/usecases/create_new_category_usecase.dart';

class CreateNewCategoryUseCaseImp implements CreateNewCategoryUseCase {
  HomeRepository homeRepository;

  CreateNewCategoryUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, dynamic>> createNewCategory(
      String icon, String category) {
    return homeRepository.createNewCategory(icon, category);
  }
}
