import 'package:get_it/get_it.dart';
import 'package:lojamanager/core/archiceture/bloc.dart';
import 'package:lojamanager/core/services/authservice/auth_service.dart';
import 'package:lojamanager/core/services/databaseservice/database_service.dart';
import 'package:lojamanager/features/initialize/presentation/controllers/initialize_bloc.dart';
import 'package:lojamanager/features/login/presentation/bloc/login_bloc.dart';
import 'package:lojamanager/features/register/data/datasources/register_datasource.dart';
import 'package:lojamanager/features/register/data/datasources/remote/register_datasource_remote_imp.dart';
import 'package:lojamanager/features/register/data/repositories/register_repository_imp.dart';
import 'package:lojamanager/features/register/domain/repositories/register_repository.dart';
import 'package:lojamanager/features/register/domain/usecases/register_usecase.dart';
import 'package:lojamanager/features/register/domain/usecases/register_usecase_imp.dart';
import 'package:lojamanager/features/register/presentation/bloc/register_bloc.dart';

class Inject {
  static initialize() {
    final getIt = GetIt.I;

    // core

    getIt.registerLazySingleton<Bloc>(() => Bloc());
    getIt.registerLazySingleton<AuthService>(() => AuthService());
    getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());

    // datasources

    getIt.registerLazySingleton<RegisterDataSource>(() =>
        RegisterDataSourceRemoteImp(
            authService: getIt(), databaseService: getIt()));

    // repositories
    getIt.registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImp(getIt()));

    // usecases
    getIt.registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCaseImp(getIt()));

    // bloc

    getIt.registerFactory<RegisterBloc>(() => RegisterBloc(getIt()));
    getIt.registerFactory<LoginBloc>(() => LoginBloc());
    getIt.registerFactory<InitializeBloc>(() => InitializeBloc());
  }
}
