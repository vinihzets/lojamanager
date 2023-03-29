import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lojamanager/core/failure/failure.dart';
import 'package:lojamanager/core/services/auth/auth_service.dart';
import 'package:lojamanager/core/services/database/database_service.dart';
import 'package:lojamanager/features/home/data/datasources/home_datasources.dart';
import 'package:lojamanager/features/home/data/dto/orders_dto.dart';
import 'package:lojamanager/features/home/data/dto/users_dto.dart';
import 'package:lojamanager/features/home/domain/entities/orders_entity.dart';
import 'package:lojamanager/features/home/domain/entities/users_entity.dart';

class HomeDataSourcesRemoteImp implements HomeDataSources {
  AuthService authService;
  DatabaseService databaseService;

  HomeDataSourcesRemoteImp(this.authService, this.databaseService);

  Future<Either<Failure, void>> signOut() async {
    try {
      final signOutRequest = await authService.auth.signOut();
      return Right(signOutRequest);
    } on FirebaseAuthException catch (e) {
      return left(RemoteFailure(message: e.message ?? ''));
    }
  }

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
}
