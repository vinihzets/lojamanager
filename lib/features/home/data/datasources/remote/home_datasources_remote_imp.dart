import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/core/services/auth/auth_service.dart';
import 'package:lojamanager/features/home/data/datasources/home_datasources.dart';

class HomeDataSourcesRemoteImp implements HomeDataSources {
  AuthService authService;

  HomeDataSourcesRemoteImp(this.authService);

  Future<Either<Failure, void>> signOut() async {
    try {
      final signOutRequest = await authService.auth.signOut();
      return Right(signOutRequest);
    } on FirebaseAuthException catch (e) {
      return left(RemoteFailure(message: e.message ?? ''));
    }
  }
}
