import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/repositories/home_repository.dart';
import 'package:lojamanager/features/home/domain/usecases/remove_category_usecase.dart';

class RemoveCategoryUseCaseImp implements RemoveCategoryUseCase {
  HomeRepository homeRepository;

  RemoveCategoryUseCaseImp(this.homeRepository);

  Future<Either<Failure, void>> removeCategory(String id) {
    return homeRepository.removeCategory(id);
  }
}
