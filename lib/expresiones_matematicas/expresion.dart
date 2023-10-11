class Expresion {
  static const strNum = ['.', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  int extremoDerecho = -1;
  int raiz = -1;
  String numAct = '';
  List<NodoArbol> arbol = [];

  void agregarDigito(String elem) {
    if (strNum.contains(elem)) {
      numAct = numAct + elem;
    }
  }

  void insertarEnExtremoDerecho(String elem) {
    arbol.add(NodoArbol(elem: elem));
    if (extremoDerecho != -1) {
      arbol[extremoDerecho].der = arbol.length - 1;
    } else {
      raiz = 0;
    }
    extremoDerecho = arbol.length - 1;
  }

  void insertarEnRaiz(String elem) {
    arbol.add(NodoArbol(elem: elem, izq: raiz));
    raiz = arbol.length - 1;
    extremoDerecho = raiz;
  }

  void agregarOperador(String elem) {
    if (elem == '+' || elem == '-') {
      insertarEnExtremoDerecho(numAct);
      numAct = '';
      insertarEnRaiz(elem);
    } else if (elem == '*' || elem == '/') {
      insertarEnExtremoDerecho(elem);
      arbol.add(NodoArbol(elem: numAct));
      arbol[extremoDerecho].izq = arbol.length - 1;
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
