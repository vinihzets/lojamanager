import 'package:get_it/get_it.dart';
import 'package:lojamanager/core/archiceture/bloc.dart';
import 'package:lojamanager/features/initialize/presentation/controllers/initialize_bloc.dart';

class Inject {
  static Initialize() {
    final getIt = GetIt.I;

    // core

    getIt.registerLazySingleton<Bloc>(() => Bloc());

    // datasources

    // repositories

    // usecases

    // bloc

    getIt.registerFactory<InitializeBloc>(() => InitializeBloc());
  }
}
