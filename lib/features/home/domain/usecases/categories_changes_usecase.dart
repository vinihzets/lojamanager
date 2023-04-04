import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';

abstract class CategoriesChangesUseCase {
  Future<Either<Failure, void>> categoriesChanges(
      // String image,
      String category,
      String id);
}
