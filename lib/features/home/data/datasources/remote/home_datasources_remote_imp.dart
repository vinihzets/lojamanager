import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/core/services/auth/auth_service.dart';
import 'package:lojamanager/core/services/database/database_service.dart';
import 'package:lojamanager/features/home/data/datasources/home_datasources.dart';
import 'package:lojamanager/features/home/data/dto/categories_dto.dart';
import 'package:lojamanager/features/home/data/dto/orders_dto.dart';
import 'package:lojamanager/features/home/data/dto/products_categories_dto.dart';
import 'package:lojamanager/features/home/data/dto/users_dto.dart';
import 'package:lojamanager/features/home/domain/entities/categories_entity.dart';
import 'package:lojamanager/features/home/domain/entities/orders_entity.dart';
import 'package:lojamanager/features/home/domain/entities/products_categories_entity.dart';
import 'package:lojamanager/features/home/domain/entities/users_entity.dart';

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
  Future<Either<Failure, void>> removeCategory(String id) async {
    try {
      final db =
          await databaseService.db.collection('products').doc(id).delete();

      return Right(db);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }

  @override
  Future<Either<Failure, void>> createNewProduct(
      String description,
      String categoryID,
      String image,
      List images,
      String name,
      String price,
      List sizes) async {
    try {
      final db = await databaseService.db
          .collection('products')
          .doc(categoryID)
          .collection('items')
          .add({
        'description': description,
        'idCategory': categoryID,
        'image': image,
        'images': images,
        'name': name,
        'price': price,
        'sizes': sizes,
      }).then((value) => databaseService.db
              .collection('products')
              .doc(categoryID)
              .collection('items')
              .doc(value.id)
              .update({'id': value.id}));

      return Right(db);
    } on FirebaseException catch (e) {
      return Left(RemoteFailure(message: e.message ?? ''));
    }
  }
}
