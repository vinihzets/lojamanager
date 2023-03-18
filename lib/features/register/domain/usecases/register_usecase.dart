import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lojamanager/features/register/domain/entities/register_entity.dart';

import '../../../../core/failure/failure.dart';

abstract class RegisterUseCase {
  Future<Either<Failure, UserCredential>> register(
      String email, String password);
}
