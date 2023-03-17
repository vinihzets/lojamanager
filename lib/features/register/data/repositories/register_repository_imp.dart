import 'package:lojamanager/core/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:lojamanager/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImp implements RegisterRepository {
  @override
  Future<Either<Failure, UserCredential>> register() {
    throw UnimplementedError();
  }
}
