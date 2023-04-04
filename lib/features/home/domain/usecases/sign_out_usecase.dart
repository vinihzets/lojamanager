import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';

abstract class SignOutUseCase {
  Future<Either<Failure, void>> signOut();
}
