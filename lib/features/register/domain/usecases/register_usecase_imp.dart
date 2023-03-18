import 'package:lojamanager/core/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:lojamanager/features/register/domain/entities/register_entity.dart';
import 'package:lojamanager/features/register/domain/repositories/register_repository.dart';
import 'package:lojamanager/features/register/domain/usecases/register_usecase.dart';

class RegisterUseCaseImp implements RegisterUseCase {
  RegisterRepository registerRepository;

  RegisterUseCaseImp(this.registerRepository);

  @override
  Future<Either<Failure, UserCredential>> register(
      String email, String password) {
    return registerRepository.register(email, password);
  }
}
