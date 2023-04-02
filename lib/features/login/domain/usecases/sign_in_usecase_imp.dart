import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/login/domain/usecases/sign_in_usecase.dart';

import '../repositories/login_repository.dart';

class SignInUseCaseImp implements SignInUseCase {
  LoginRepository loginRepository;

  SignInUseCaseImp(this.loginRepository);

  @override
  Future<Either<Failure, UserCredential>> signIn(
      String email, String password) {
    return loginRepository.signIn(email, password);
  }
}
