import 'package:lojamanager/core/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:lojamanager/features/register/data/datasources/register_datasource.dart';
import 'package:lojamanager/features/register/domain/entities/register_entity.dart';
import 'package:lojamanager/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImp implements RegisterRepository {
  RegisterDataSource registerDataSource;

  RegisterRepositoryImp(this.registerDataSource);

  @override
  Future<Either<Failure, UserCredential>> register(
      String email, String password) {
    return registerDataSource.register(email, password);
  }
}
