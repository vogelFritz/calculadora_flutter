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
    int iAct;
    if (expresion.raiz != -1) {
      iAct = expresion.raiz;
      while (expresion.arbol[iAct].der != -1) {
        iAct = expresion.arbol[iAct].der;
      }
      expresion.arbol.add(NodoArbol(elem: expresion.numAct));
      expresion.arbol[iAct].der = expresion.arbol.length - 1;
    } else {
      expresion.raiz = 0;
      expresion.arbol.add(NodoArbol(elem: expresion.numAct));
    }
    ans = expresion.resultado(expresion.raiz);
    result = ans.toString();
    displayReset();
  }
}
