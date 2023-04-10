import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../core/services/auth/auth_service.dart';
import '../../../../../core/services/database/database_service.dart';
import '../home_datasources.dart';
import '../../dto/categories_dto.dart';
import '../../dto/orders_dto.dart';
import '../../dto/products_categories_dto.dart';
import '../../dto/users_dto.dart';
import '../../../domain/entities/categories_entity.dart';
import '../../../domain/entities/orders_entity.dart';
import '../../../domain/entities/products_categories_entity.dart';
import '../../../domain/entities/users_entity.dart';

class HomeDataSourcesRemoteImp implements HomeDataSources {
  AuthService authService;
  DatabaseService databaseService;

  HomeDataSourcesRemoteImp(this.authService, this.databaseService);

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final signOutRequest = await authService.auth.signOut();
      return Right(signOutRequest);
    } on FirebaseAuthException catch (e) {
      return left(RemoteFailure(message: e.message ?? ''));
    }
  }

  @override
  Future<Either<Failure, List<UsersEntity>>> getUsers() async {
    try {
      final dbRequest = await databaseService.db.collection('users').get();

      final request =
          dbRequest.docs.map((e) => UsersDto.fromJson(e.data())).toList();
      return Right(request);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }

  @override
  Future<Either<Failure, List<OrdersEntity>>> getOrders() async {
    try {
      final dbRequest = await databaseService.db.collection('orders').get();

      final dbList =
          dbRequest.docs.map((e) => OrdersDto.fromJson(e.data())).toList();

      return Right(dbList);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ' '));
    }
  }

  @override
  Future<Either<Failure, void>> statusDown(OrdersDto ordersDto) async {
    try {
      ordersDto.status--;
      final dbRequest = await databaseService.db
          .collection('orders')
          .doc(ordersDto.orderId)
          .update(ordersDto.toMap());

      return Right(dbRequest);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }

  @override
  Future<Either<Failure, void>> statusUp(OrdersDto ordersDto) async {
    try {
      ordersDto.status++;
      final dbRequest = await databaseService.db
          .collection('orders')
          .doc(ordersDto.orderId)
          .update(ordersDto.toMap());

      return Right(dbRequest);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }

  @override
  Future<Either<Failure, List<CategoriesEntity>>> getCategories() async {
    try {
      final dbRequest = await databaseService.db.collection('products').get();
      final db =
          dbRequest.docs.map((e) => CategoriesDto.fromJson(e.data())).toList();

      return Right(db);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ' '));
    }
  }

  @override
  Future<Either<Failure, List<ProductsCategoriesEntity>>> getProductsCategories(
      String id) async {
    try {
      final db = await databaseService.db
          .collection('products')
          .doc(id)
          .collection('items')
          .get();

      final products =
          db.docs.map((e) => ProductsCategoriesDto.fromJson(e.data())).toList();

      return Right(products);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }

  @override
  Future<Either<Failure, void>> categoriesChanges(
      // String image,
      String category,
      String id) async {
    try {
      final db = databaseService.db.collection('products').doc(id);
      final requestVoid = db.update({
        'name': category,
      });

      return Right(requestVoid);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }

  @override
  Future<Either<Failure, dynamic>> createNewCategory(
      String icon, String category) async {
    try {
      final db = databaseService.db.collection('products');
      final dbAdd = await db.add({
        'icon': icon,
        'name': category,
      }).then((value) {
        databaseService.db
            .collection('products')
            .doc(value.id)
            .update({'id': value.id});
      });

      return Right(dbAdd);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }

  @override
  Future<Either<Failure, void>> removeCategory(
    String id,
  ) async {
    try {
      final verifyExistsDocs = databaseService.db
          .collection('products')
          .doc(id)
          .collection('items')
          .get()
          .then((doc) {
        if (doc.docs.isNotEmpty) {
        } else {
          databaseService.db.collection('products').doc(id).delete();
        }
      });

      return Right(verifyExistsDocs);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }

  @override
  Future<Either<Failure, void>> createNewProduct(
      String description,
      String categoryID,
      List images,
      String name,
      String price,
      List sizes,
      DateTime createdAt,
      String productId) async {
    try {
      final db = await databaseService.db
          .collection('products')
          .doc(categoryID)
          .collection('items')
          .add({
        'description': description,
        'categoryId': categoryID,
        'images': images,
        'name': name,
        'price': price,
        'sizes': sizes,
        'createdAt': createdAt,
      }).then((value) async {
        await databaseService.db
            .collection('products')
            .doc(categoryID)
            .collection('items')
            .doc(value.id)
            .update({'productId': value.id});

        await databaseService.db.collection('news').doc(value.id).set({
          'description': description,
          'categoryId': categoryID,
          'productId': value.id,
          'images': images,
          'name': name,
          'price': price,
          'sizes': sizes,
          'createdAt': createdAt,
        });
      });

      return Right(db);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }

  @override
  Future<Either<Failure, void>> removeProducts() {
    // ainda nao implementado //
    throw UnimplementedError();
  }
}
