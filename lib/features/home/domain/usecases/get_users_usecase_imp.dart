import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/entities/users_entity.dart';
import 'package:lojamanager/features/home/domain/repositories/home_repository.dart';
import 'package:lojamanager/features/home/domain/usecases/get_users_usecase.dart';

class GetUsersUseCaseImp implements GetUsersUseCase {
  HomeRepository homeRepository;

  GetUsersUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, List<UsersEntity>>> getUsers() {
    return homeRepository.getUsers();
  }
}
