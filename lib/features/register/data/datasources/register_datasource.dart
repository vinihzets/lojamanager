import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lojamanager/core/failure/failure.dart';

abstract class RegisterDataSource {
  Future<Either<Failure, UserCredential>> register();
}
