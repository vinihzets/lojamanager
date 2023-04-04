import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';

abstract class RemoveCategoryUseCase {
  Future<Either<Failure, void>> removeCategory(String id);
}
