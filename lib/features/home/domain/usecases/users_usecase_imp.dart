import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/users_entity.dart';
import '../repositories/home_repository.dart';
import 'users_usecase.dart';

class UsersUseCaseImp implements UsersUseCase {
  HomeRepository homeRepository;

  UsersUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, List<UsersEntity>>> getUsers() {
    return homeRepository.getUsers();
  }
}
