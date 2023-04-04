import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/entities/users_entity.dart';

abstract class GetUsersUseCase {
  Future<Either<Failure, List<UsersEntity>>> getUsers();
}
