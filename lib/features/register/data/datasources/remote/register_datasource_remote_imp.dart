import 'package:lojamanager/core/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/services/authservice/auth_service.dart';
import 'package:lojamanager/core/services/databaseservice/database_service.dart';
import 'package:lojamanager/features/register/data/datasources/register_datasource.dart';
import 'package:lojamanager/features/register/domain/entities/register_entity.dart';

class RegisterDataSourceRemoteImp implements RegisterDataSource {
  AuthService authService;
  DatabaseService databaseService;

  RegisterDataSourceRemoteImp(
      {required this.authService, required this.databaseService});

  @override
  Future<Either<Failure, UserCredential>> register(
      String email, String password) async {
    try {
      final registerRequest = await authService.auth
          .createUserWithEmailAndPassword(email: email, password: password);

      final dbuser = databaseService.usersgestor;
      dbuser.add({'email': email}).then((value) => value.id);

      return Right(registerRequest);
    } on FirebaseAuthException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }
}
