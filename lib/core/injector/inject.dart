import 'package:get_it/get_it.dart';
import 'package:lojamanager/core/archiceture/bloc.dart';
import 'package:lojamanager/core/services/authservice/auth_service.dart';
import 'package:lojamanager/core/services/databaseservice/database_service.dart';
import 'package:lojamanager/features/initialize/presentation/controllers/initialize_bloc.dart';
import 'package:lojamanager/features/login/data/datasources/login_datasources.dart';
import 'package:lojamanager/features/login/data/datasources/remote/login_datasources_remote_imp.dart';
import 'package:lojamanager/features/login/data/repositories/login_repository_imp.dart';
import 'package:lojamanager/features/login/domain/repositories/login_repository.dart';
import 'package:lojamanager/features/login/domain/usecases/sign_in_usecase.dart';
import 'package:lojamanager/features/login/domain/usecases/sign_in_usecase_imp.dart';
import 'package:lojamanager/features/login/presentation/bloc/login_bloc.dart';

class Inject {
  static initialize() {
    final getIt = GetIt.I;

    // core

    getIt.registerLazySingleton<Bloc>(() => Bloc());
    getIt.registerLazySingleton<AuthService>(() => AuthService());
    getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());

    // datasources

    getIt.registerLazySingleton<LoginDataSources>(
        () => LoginDataSourcesRemoteImp(getIt(), getIt()));
    // repositories

    getIt.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImp(getIt()));

    // usecases

    getIt.registerLazySingleton<SignInUseCase>(() => SignInUseCaseImp(getIt()));

    // bloc

    getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt(), getIt()));
    getIt.registerFactory<InitializeBloc>(() => InitializeBloc());
  }
}
