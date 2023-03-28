import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, void>> signOut();
}
