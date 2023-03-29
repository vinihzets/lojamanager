import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/data/datasources/home_datasources.dart';
import 'package:lojamanager/features/home/domain/entities/users_entity.dart';
import 'package:lojamanager/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  HomeDataSources homeDataSources;

  HomeRepositoryImp(this.homeDataSources);

  Future<Either<Failure, void>> signOut() {
    return homeDataSources.signOut();
  }

  Future<Either<Failure, List<UsersEntity>>> getUsers() {
    return homeDataSources.getUsers();
  }
}
