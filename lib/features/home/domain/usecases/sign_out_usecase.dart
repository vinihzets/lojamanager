import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';

abstract class SignOutUseCase {
  Future<Either<Failure, void>> signOut();
}
