import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContadorProvider extends ChangeNotifier {
  int _contador;

  ContadorProvider(this._contador);

  void incrementar() {
    _contador++;
    notifyListeners();
  }

  int get contador => _contador;
  //Setter
  set contador(int value) {
    _contador = value;
    notifyListeners();
  }
}
