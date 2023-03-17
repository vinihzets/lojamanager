import 'package:lojamanager/core/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:lojamanager/features/register/data/datasources/register_datasource.dart';

class RegisterDataSourceRemoteImp implements RegisterDataSource {
  @override
  Future<Either<Failure, UserCredential>> register() {
    throw UnimplementedError();
  }
}
