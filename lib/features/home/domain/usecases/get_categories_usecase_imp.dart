import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/categories_entity.dart';
import '../repositories/home_repository.dart';
import 'get_categories_usecase.dart';

class GetCategoriesUseCaseImp implements GetCategoriesUseCase {
  HomeRepository homeRepository;

  GetCategoriesUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, List<CategoriesEntity>>> getCategories() {
    return homeRepository.getCategories();
  }
}
