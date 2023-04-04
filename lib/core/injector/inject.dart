import 'package:get_it/get_it.dart';
import 'package:lojamanager/features/home/domain/usecases/categories_usecase.dart';
import 'package:lojamanager/features/home/domain/usecases/categories_usecase_imp.dart';
import '../services/auth/auth_service.dart';
import '../services/database/database_service.dart';
import '../../features/home/data/datasources/home_datasources.dart';
import '../../features/home/data/datasources/remote/home_datasources_remote_imp.dart';
import '../../features/home/data/repositories/home_repository_imp.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/create_new_product_usecase.dart';
import '../../features/home/domain/usecases/create_new_product_usecase_imp.dart';
import '../../features/home/domain/usecases/orders_usecase.dart';
import '../../features/home/domain/usecases/orders_usecase_imp.dart';
import '../../features/home/domain/usecases/users_usecase.dart';
import '../../features/home/domain/usecases/users_usecase_imp.dart';
import '../../features/home/domain/usecases/sign_out_usecase.dart';
import '../../features/home/domain/usecases/sign_out_usecase_imp.dart';
import '../../features/home/domain/usecases/status_orders_usecase.dart';
import '../../features/home/domain/usecases/status_orders_usecase_imp.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/initialize/presentation/bloc/initialize_bloc.dart';
import '../../features/login/data/datasources/login_datasources.dart';
import '../../features/login/data/datasources/remote/login_datasources_remote_imp.dart';
import '../../features/login/data/repositories/login_repository_imp.dart';
import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/domain/usecases/sign_in_usecase.dart';
import '../../features/login/domain/usecases/sign_in_usecase_imp.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/products/data/datasources/product_datasources.dart';
import '../../features/products/data/datasources/remote/product_datasources_remote_imp.dart';
import '../../features/products/data/repositories/product_repository_imp.dart';
import '../../features/products/domain/repositories/product_repository.dart';
import '../../features/products/domain/usecases/product_modify_usecase.dart';
import '../../features/products/domain/usecases/product_modify_usecase_imp.dart';
import '../../features/products/presentation/bloc/product_bloc.dart';

class Inject {
  static initialize() {
    final getIt = GetIt.I;

    // core

    getIt.registerLazySingleton(() => AuthService());
    getIt.registerLazySingleton(() => DatabaseService());
    // datasources

    getIt.registerLazySingleton<ProductDataSources>(
        () => ProductDataSourcesRemoteImp(getIt()));

    getIt.registerLazySingleton<HomeDataSources>(
        () => HomeDataSourcesRemoteImp(getIt(), getIt()));

    getIt.registerLazySingleton<LoginDataSources>(
        () => LoginDataSourcesRemoteImp(getIt(), getIt()));
    // repositories

    getIt.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImp(getIt()));

    getIt.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImp(getIt()));

    getIt.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImp(getIt()));
    // usecases

    getIt.registerLazySingleton<CategoriesUseCase>(
        () => CategoriesUseCaseImp(getIt()));

    getIt.registerLazySingleton<CreateNewProductUseCase>(
        () => CreateNewProductUseCaseImp(getIt()));

    getIt.registerLazySingleton<ProductModifyUseCase>(
        () => ProductModifyUseCaseImp(getIt()));

    getIt.registerLazySingleton<StatusOrderUseCase>(
        () => StatusOrderUseCaseImp(getIt()));
    getIt.registerLazySingleton<OrdersUseCase>(() => OrdersUseCaseImp(getIt()));

    getIt.registerLazySingleton<UsersUseCase>(() => UsersUseCaseImp(getIt()));

    getIt.registerLazySingleton<SignInUseCase>(() => SignInUseCaseImp(getIt()));
    getIt.registerLazySingleton<SignOutUseCase>(
        () => SignOutUseCaseImp(getIt()));
    // bloc

    getIt.registerFactory(() => ProductBloc(getIt()));
    getIt.registerFactory(
        () => HomeBloc(getIt(), getIt(), getIt(), getIt(), getIt(), getIt()));
    getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt(), getIt()));
    getIt.registerFactory<InitializeBloc>(() => InitializeBloc(getIt()));
  }
}
