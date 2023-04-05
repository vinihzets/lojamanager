import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../core/services/database/database_service.dart';
import '../product_datasources.dart';

class ProductDataSourcesRemoteImp implements ProductDataSources {
  DatabaseService databaseService;

  ProductDataSourcesRemoteImp(this.databaseService);

  @override
  Future<Either<Failure, void>> productModify(
      String name,
      String description,
      String price,
      String idCategories,
      String idProduct,
      List sizes,
      List images) async {
    try {
      final db = databaseService.db
          .collection('products')
          .doc(idCategories)
          .collection('items')
          .doc(idProduct)
          .update({
        'name': name,
        'description': description,
        'price': price,
        'sizes': sizes,
        'images': images,
      });

      return Right(db);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }

  @override
  Future<Either<Failure, void>> productRemove(
      String idCategory, String productId) async {
    try {
      final removeRequest = await databaseService.db
          .collection('products')
          .doc(idCategory)
          .collection('items')
          .doc(productId)
          .delete();

      return Right(removeRequest);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }
}
