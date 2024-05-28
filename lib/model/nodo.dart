class Nodo {
  Nodo? nodoIzquierdo;
  Nodo? nodoDerecho;
  int clave;
  int altura = 1;
  bool ultimo = false;
  bool buscando = false;
  // Constructor
  Nodo(this.clave);
}

