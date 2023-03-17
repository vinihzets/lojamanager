import 'package:lojamanager/core/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:lojamanager/features/register/domain/usecases/register_usecase.dart';

class RegisterUseCaseImp implements RegisterUseCase {
  @override
  Future<Either<Failure, UserCredential>> register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
