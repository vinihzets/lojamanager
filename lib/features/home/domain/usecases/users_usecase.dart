import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/users_entity.dart';

abstract class UsersUseCase {
  Future<Either<Failure, List<UsersEntity>>> getUsers();
}
