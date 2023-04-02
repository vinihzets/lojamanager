import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/features/home/domain/repositories/home_repository.dart';
import 'package:lojamanager/features/home/domain/usecases/sign_out_usecase.dart';

class SignOutUseCaseImp implements SignOutUseCase {
  HomeRepository homeRepository;

  SignOutUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, void>> signOut() {
    return homeRepository.signOut();
  }
}
