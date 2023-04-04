import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../repositories/home_repository.dart';
import 'remove_category_usecase.dart';

class RemoveCategoryUseCaseImp implements RemoveCategoryUseCase {
  HomeRepository homeRepository;

  RemoveCategoryUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, void>> removeCategory(String id) {
    return homeRepository.removeCategory(id);
  }
}
