import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/core/services/database/database_service.dart';
import 'package:lojamanager/features/products/data/datasources/product_datasources.dart';

class ProductDataSourcesRemoteImp implements ProductDataSources {
  DatabaseService databaseService;

  ProductDataSourcesRemoteImp(this.databaseService);

  @override
  Future<Either<Failure, void>> productModify(String name, String description,
      String price, String idCategories, String idProduct) async {
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
      });

      return Right(db);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }
}
