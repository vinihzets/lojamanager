import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lojamanager/core/failure/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserCredential>> signIn(String email, String password);
}
