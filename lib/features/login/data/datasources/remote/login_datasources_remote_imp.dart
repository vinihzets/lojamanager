import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/core/services/auth/auth_service.dart';
import 'package:lojamanager/core/services/database/database_service.dart';
import 'package:lojamanager/features/login/data/datasources/login_datasources.dart';

class LoginDataSourcesRemoteImp implements LoginDataSources {
  AuthService authService;
  DatabaseService databaseService;

  LoginDataSourcesRemoteImp(this.authService, this.databaseService);

  @override
  Future<Either<Failure, UserCredential>> signIn(
      String email, String password) async {
    try {
      final loginRequest = await authService.auth
          .signInWithEmailAndPassword(email: email, password: password);

      return Right(loginRequest);
    } on FirebaseAuthException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }
}
