import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/repositories/login_repository.dart';

import '../datasources/login_datasources.dart';

class LoginRepositoryImp implements LoginRepository {
  LoginDataSources loginDataSources;

  LoginRepositoryImp(this.loginDataSources);

  @override
  Future<Either<Failure, UserCredential>> signIn(
      String email, String password) {
    return loginDataSources.signIn(email, password);
  }
}
