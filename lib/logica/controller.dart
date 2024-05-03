import "package:arbol_avl/logica/nodoWidget.dart";

class ArbolAvl{
  Nodo? raiz;

   void insertar(String clave, double screenWidth){

      _insertarNodo(raiz, clave, screenWidth);
      
  } 

 /* void _insertarNodo(Nodo? nodo, String clave, double screenWidth){
        double valorX = screenWidth/2;
        double valorY = screenWidth/30;

        if (nodo == null) {
        raiz = Nodo(
            clave: clave,
            valorX: screenWidth / 2,  //Coordenada X para la raíz
            valorY: screenWidth / 20, //Coordenada Y para la raíz
        );
        return; 
        }

        int comparador;
        int nivel = nodo.nivel;

        double posicionX(int comparador){
          if(comparador <= 0){
            return valorX - 100;
          }
          return valorX + 100;
        }

        double posicionY(int nivel){
            return valorY * nivel;
        }

        if (clave.compareTo(nodo.clave) <= 0) {

            if (nodo.nodoIzquierdo == null){
              comparador = 0;
 
              nodo.nodoIzquierdo = Nodo(
                valorX: posicionX(comparador), 
                valorY: posicionY(nivel), 
                clave: clave
              );

              nodo.nivel = nodo.nivel+1;
            } _insertarNodo(nodo.nodoIzquierdo, clave, screenWidth);       

        }else{
            if (nodo.nodoDerecho == null){
              comparador = 1;

              nodo.nodoIzquierdo = Nodo(
                valorX: posicionX(comparador), 
                valorY: posicionY(nivel), 
                clave: clave
              );  

              nodo.nivel = nodo.nivel+1;
            } _insertarNodo(nodo.nodoDerecho, clave, screenWidth); 
        }
  }
}
 */
   void _insertarNodo(Nodo? nodo, String clave, double screenWidth) {
    // Verifica si la raíz es nula
    if (nodo == null) {
        raiz = Nodo(
            clave: clave,
            valorX: screenWidth / 2, // Coordenada X para la raíz
            valorY: screenWidth / 20, // Coordenada Y para la raíz
        );
        return; // Termina aquí, ya que hemos inicializado la raíz
    }

    int comparador = clave.compareTo(nodo.clave);
    double valorX = screenWidth / 2; // Base para calcular las coordenadas
    double valorY = screenWidth / 20;

    // Ajusta el nivel de los nodos hijos
    int nivelHijo = nodo.nivel + 1;

    double posicionX(int nivel, int comparador) {
        double offset = 100 / nivel;
        if (comparador <= 0) {
            return nodo.valorX - offset;
        } else {
            return nodo.valorX + offset;
        }
    }

    double posicionY(int nivel) {
        return nodo.valorY + (screenWidth / 30 * nivel);
    }

    if (comparador <= 0) {
        // Inserción en el subárbol izquierdo
        if (nodo.nodoIzquierdo == null) {
            nodo.nodoIzquierdo = Nodo(
                clave: clave,
                valorX: posicionX(nivelHijo, comparador),
                valorY: posicionY(nivelHijo),
            );
        } else {
            // Continua la inserción recursiva en el subárbol izquierdo
            _insertarNodo(nodo.nodoIzquierdo, clave, screenWidth);
        }
    } else {
        // Inserción en el subárbol derecho
        if (nodo.nodoDerecho == null) {
            nodo.nodoDerecho = Nodo(
                clave: clave,
                valorX: posicionX(nivelHijo, comparador),
                valorY: posicionY(nivelHijo),
            );
        } else {
            // Continua la inserción recursiva en el subárbol derecho
            _insertarNodo(nodo.nodoDerecho, clave, screenWidth);
        }
    }
}
} 
 

/* class ArbolBinario {
    Nodo? raiz; 


     void insertar(String clave, double screenWidth, int nivel) {
        raiz = _insertarNodo(raiz, clave, screenWidth / 2, nivel, screenWidth);
    }

    Nodo? _insertarNodo(Nodo? raiz, String clave, double posicionX, int nivel, double screenWidth) {
       
        if (raiz == null) {
            return Nodo(valorX: posicionX, valorY: nivel * 100, clave: clave);
        }

       
        if (clave.compareTo(raiz.clave) < 0) {
            
            double nuevaPosicionX = posicionX - (screenWidth / (2 * nivel));
            raiz.nodoIzquierdo = _insertarNodo(raiz.nodoIzquierdo, clave, nuevaPosicionX, nivel + 1, screenWidth);
        } else {
           
            double nuevaPosicionX = posicionX + (screenWidth / (2 * nivel));
            raiz.nodoDerecho = _insertarNodo(raiz.nodoDerecho, clave, nuevaPosicionX, nivel + 1, screenWidth);
        }

        return raiz;
    }


    void eliminar(String clave) {
        raiz = _eliminarNodo(raiz, clave);
    }

    Nodo? _eliminarNodo(Nodo? raiz, String clave) {
        // Si la raíz es nula, no hay nada que eliminar
        if (raiz == null) {
            return null;
        }

        // Comparar la clave del nodo actual con la clave del nodo a eliminar
        if (clave.compareTo(raiz.clave) < 0) {
            // Si la clave es menor, eliminar del subárbol izquierdo
            raiz.nodoIzquierdo = _eliminarNodo(raiz.nodoIzquierdo, clave);
        } else if (clave.compareTo(raiz.clave) > 0) {
            // Si la clave es mayor, eliminar del subárbol derecho
            raiz.nodoDerecho = _eliminarNodo(raiz.nodoDerecho, clave);
        } else {
            // Encontrar el nodo que se debe eliminar
            if (raiz.nodoIzquierdo == null) {
                // El nodo solo tiene un hijo derecho o ningún hijo
                return raiz.nodoDerecho;
            } else if (raiz.nodoDerecho == null) {
                // El nodo solo tiene un hijo izquierdo
                return raiz.nodoIzquierdo;
            }

            // Nodo con ambos hijos: encontrar el sucesor en el subárbol derecho
            Nodo sucesor = _encontrarSucesor(raiz.nodoDerecho!);
            raiz.clave = sucesor.clave;
            raiz.nodoDerecho = _eliminarNodo(raiz.nodoDerecho, sucesor.clave);
        }

        return raiz;
    }

    Nodo _encontrarSucesor(Nodo nodo) {
        Nodo actual = nodo;
        while (actual.nodoIzquierdo != null) {
            actual = actual.nodoIzquierdo!;
        }
        return actual;
    }
} */