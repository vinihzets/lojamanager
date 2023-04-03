import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';

abstract class CreateNewCategoryUseCase {
  Future<Either<Failure, dynamic>> createNewCategory(
      String icon, String category);
}
