import 'package:dartz/dartz.dart';
import 'package:lojamanager/core/failure/failure.dart';

abstract class ProductsUseCase {
  Future<Either<Failure, void>> removeProducts();
}
