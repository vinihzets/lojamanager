import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../repositories/home_repository.dart';
import 'sign_out_usecase.dart';

class SignOutUseCaseImp implements SignOutUseCase {
  HomeRepository homeRepository;

  SignOutUseCaseImp(this.homeRepository);

  @override
  Future<Either<Failure, void>> signOut() {
    return homeRepository.signOut();
  }
}
