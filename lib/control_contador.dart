import 'dart:async';

class ControlContador {
  final _streamController = StreamController<int>();

  int _contador = 0;

  Sink<int> get sink => _streamController.sink;
  Stream<int> get stream => _streamController.stream;

  void incrementar() {
    _contador++;
    sink.add(_contador);
  }

  dispose() => _streamController.close();
}
