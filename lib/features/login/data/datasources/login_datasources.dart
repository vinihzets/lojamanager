import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/failure/failure.dart';

abstract class LoginDataSources {
  Future<Either<Failure, UserCredential>> signIn(String email, String password);
}
