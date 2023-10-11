import 'package:calculadora/expresiones_matematicas/expresion.dart';
import 'package:flutter/material.dart';

class DisplayProvider extends ChangeNotifier {
  String display = '', result = '';
  double ans = 0;
  Expresion expresion = Expresion();

  void displayPrint(String x) {
    display = display + x;
    notifyListeners();
  }

  void displayReset() {
    display = '';
    expresion = Expresion();
    notifyListeners();
  }

  void displayDel() {
    if (display.isNotEmpty) display = display.substring(0, display.length - 1);
    notifyListeners();
  }

  void displayPrintResult() {
    for (int i = 0; i < display.length; i++) {
      if (Expresion.strNum.contains(display[i])) {
        expresion.agregarDigito(display[i]);
      } else {
        expresion.agregarOperador(display[i]);
      }
    }
    expresion.insertarEnExtremoDerecho(expresion.numAct);
    ans = expresion.resultado(expresion.raiz);
    result = ans.toString();
    displayReset();
  }
}
