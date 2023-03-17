import 'dart:async';

import 'package:lojamanager/features/register/presentation/bloc/register_bloc_event.dart';
import 'package:lojamanager/features/register/presentation/bloc/register_bloc_state.dart';

class RegisterBloc {
  late StreamController<RegisterBlocState> _stream;
  Stream<RegisterBlocState> get stream => _stream.stream;

  late StreamController<RegisterBlocEvent> _sink;
  Sink<RegisterBlocEvent> get sink => _sink.sink;
}
