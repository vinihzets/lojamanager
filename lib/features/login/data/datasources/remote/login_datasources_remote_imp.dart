import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../core/services/auth/auth_service.dart';
import '../../../../../core/services/database/database_service.dart';
import '../login_datasources.dart';

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
