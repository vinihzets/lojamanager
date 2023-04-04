import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/users_entity.dart';
import '../repositories/home_repository.dart';
import 'get_users_usecase.dart';

class GetUsersUseCaseImp implements GetUsersUseCase {
  HomeRepository homeRepository;

  GetUsersUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, List<UsersEntity>>> getUsers() {
    return homeRepository.getUsers();
  }
}
