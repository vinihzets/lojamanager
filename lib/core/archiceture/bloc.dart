import 'dart:async';

import 'package:lojamanager/core/archiceture/bloc_event.dart';
import 'package:lojamanager/core/archiceture/bloc_state.dart';

class Bloc {
  late StreamController<BlocEvent> _event;
  Sink<BlocEvent> get event => _event.sink;

  late StreamController<BlocState> _state;
  Stream<BlocState> get state => _state.stream;

  Bloc() {
    _event = StreamController();
    _state = StreamController();

    _event.stream.listen(onEventSend);
  }

  onEventSend(BlocEvent event) {
    if (event is BlocEvent) {}
  }
}
