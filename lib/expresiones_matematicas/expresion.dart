class Expresion {
  final strNum = ['.', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  int raiz = -1;
  String numAct = '';
  List<NodoArbol> arbol = [];
  void agregarDigito(String elem) {
    if (strNum.contains(elem)) {
      numAct = numAct + elem;
    }
  }

  void agregarOperador(String elem) {
    if (elem == '+' || elem == '-') {
      int iAct;
      if (raiz != -1) {
        iAct = raiz;
        while (arbol[iAct].der != -1) {
          iAct = arbol[iAct].der;
        }
        arbol.add(NodoArbol(elem: numAct));
        arbol[iAct].der = arbol.length - 1;
      } else {
        raiz = 0;
        arbol.add(NodoArbol(elem: numAct));
      }
      numAct = '';
      arbol.add(NodoArbol(elem: elem, izq: raiz));
      raiz = arbol.length - 1;
    } else if (elem == '*' || elem == '/') {
      int iAct;
      // arbol.add(NodoArbol(elem: elem));
      if (raiz != -1) {
        iAct = raiz;
        while (arbol[iAct].der != -1) {
          iAct = arbol[iAct].der;
        }
        arbol.add(NodoArbol(elem: elem));
        arbol[iAct].der = arbol.length - 1;
      } else {
        raiz = 0;
        arbol.add(NodoArbol(elem: elem));
      }
      arbol.add(NodoArbol(elem: numAct));
      arbol[arbol.length - 2].izq = arbol.length - 1;
      numAct = '';
    }
  }

  double resultado(int iAct) {
    switch (arbol[iAct].elem) {
      case '*':
        return resultado(arbol[iAct].izq) * resultado(arbol[iAct].der);
      case '/':
        return resultado(arbol[iAct].izq) / resultado(arbol[iAct].der);
      case '+':
        return resultado(arbol[iAct].izq) + resultado(arbol[iAct].der);
      case '-':
        return resultado(arbol[iAct].izq) - resultado(arbol[iAct].der);
      default:
        return double.parse(arbol[iAct].elem);
    }
  }
}

class NodoArbol {
  String elem;
  int izq, der;
  NodoArbol({this.elem = '', this.izq = -1, this.der = -1});
}
