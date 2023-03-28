import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';

abstract class HomeDataSources {
  Future<Either<Failure, void>> signOut();
}
