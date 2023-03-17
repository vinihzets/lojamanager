import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/failure/failure.dart';

abstract class RegisterUseCase {
  Future<Either<Failure, UserCredential>> register();
}
