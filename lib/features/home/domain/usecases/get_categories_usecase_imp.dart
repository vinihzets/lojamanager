import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/entities/categories_entity.dart';
import 'package:lojamanager/features/home/domain/repositories/home_repository.dart';
import 'package:lojamanager/features/home/domain/usecases/get_categories_usecase.dart';

class GetCategoriesUseCaseImp implements GetCategoriesUseCase {
  HomeRepository homeRepository;

  GetCategoriesUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, List<CategoriesEntity>>> getCategories() {
    return homeRepository.getCategories();
  }
}
