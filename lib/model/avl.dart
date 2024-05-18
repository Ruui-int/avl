import 'dart:math';
import 'package:arbol_avl/main/main.dart';
import 'package:arbol_avl/model/nodo.dart';
import 'dart:async';

import 'package:flutter/material.dart';

class ArbolAvl  {

  final GlobalKey<MainState> mainKey = GlobalKey<MainState>();
  Nodo? raiz;
  Nodo? ultimoNodoAgregado;
  Nodo? buscandoNodo;

  void insertarNodo(int clave) {
    Nodo nodo = Nodo(clave);
    raiz = _insertar(raiz, nodo);
    if (ultimoNodoAgregado != null) {
      ultimoNodoAgregado!.ultimo = false;
    }
    nodo.ultimo = true;
    ultimoNodoAgregado = nodo;
  }

  Nodo? _insertar(Nodo? raiz, Nodo nodo) {
    if (raiz == null) {
      return nodo;
    }

    if (nodo.clave.compareTo(raiz.clave) < 0) {
      raiz.nodoIzquierdo = _insertar(raiz.nodoIzquierdo, nodo);
    } else {
      raiz.nodoDerecho = _insertar(raiz.nodoDerecho, nodo);
    }
    raiz.altura = 1 + _maxAltura(raiz.nodoIzquierdo, raiz.nodoDerecho);
    return _rebalancear(raiz);
  }

  int _maxAltura(Nodo? izquierda, Nodo? derecha) {
    return max(_altura(izquierda), _altura(derecha));
  }

  int _altura(Nodo? nodo) {
    return nodo?.altura ?? 0;
  }

  Nodo? _rebalancear(Nodo? nodo) {
    if (nodo == null) return nodo;

    int balance = _balanceFactor(nodo);

    if (balance > 1) {
      if (_balanceFactor(nodo.nodoIzquierdo) < 0) {
        nodo.nodoIzquierdo = _rotacionIzquierda(nodo.nodoIzquierdo!);
      }
      return _rotacionDerecha(nodo);
    }
    if (balance < -1) {
      if (_balanceFactor(nodo.nodoDerecho) > 0) {
        nodo.nodoDerecho = _rotacionDerecha(nodo.nodoDerecho!);
      }
      return _rotacionIzquierda(nodo);
    }
    return nodo;
  }

  int _balanceFactor(Nodo? nodo) {
    if (nodo == null) return 0;
    return _altura(nodo.nodoIzquierdo) - _altura(nodo.nodoDerecho);
  }

  Nodo? _rotacionDerecha(Nodo nodoY) {
    Nodo nodoX = nodoY.nodoIzquierdo!;
    Nodo? nodoT = nodoX.nodoDerecho;

    nodoX.nodoDerecho = nodoY;
    nodoY.nodoIzquierdo = nodoT;

    nodoY.altura = 1 + _maxAltura(nodoY.nodoIzquierdo, nodoY.nodoDerecho);
    nodoX.altura = 1 + _maxAltura(nodoX.nodoIzquierdo, nodoX.nodoDerecho);

    return nodoX;
  }

  Nodo? _rotacionIzquierda(Nodo nodoX) {
    Nodo nodoY = nodoX.nodoDerecho!;
    Nodo? nodoT = nodoY.nodoIzquierdo;

    nodoY.nodoIzquierdo = nodoX;
    nodoX.nodoDerecho = nodoT;

    nodoX.altura = 1 + _maxAltura(nodoX.nodoIzquierdo, nodoX.nodoDerecho);
    nodoY.altura = 1 + _maxAltura(nodoY.nodoIzquierdo, nodoY.nodoDerecho);

    return nodoY;
  }

  void eliminarNodo(int clave) {
    raiz = _eliminar(raiz, clave);
  }

  Nodo? _eliminar(Nodo? raiz, int clave) {
    if (raiz == null) return raiz;

    if (clave.compareTo(raiz.clave) < 0) {
      raiz.nodoIzquierdo = _eliminar(raiz.nodoIzquierdo, clave);
    } else if (clave.compareTo(raiz.clave) > 0) {
      raiz.nodoDerecho = _eliminar(raiz.nodoDerecho, clave);
    } else {
      if (raiz.nodoIzquierdo == null || raiz.nodoDerecho == null) {
        Nodo? temp = raiz.nodoIzquierdo ?? raiz.nodoDerecho;
        raiz = null;
        return temp;
      } else {
        Nodo? predecesor = _encontrarMaximo(raiz.nodoIzquierdo!);
        raiz.clave = predecesor!.clave;
        raiz.nodoIzquierdo = _eliminar(raiz.nodoIzquierdo, predecesor.clave);
      }
    }
    return _rebalancear(raiz);
  }

  Nodo? _encontrarMaximo(Nodo raiz) {
    while (raiz.nodoDerecho != null) {
      raiz = raiz.nodoDerecho!;
    }
    return raiz;
  }

  void imprimirInOrden() {
    _imprimirInOrden(raiz);
  }

  void resetArbol() {
    raiz = null;
  }

  Future<void> buscar(int clave) async {
    // Asegurarse de que el nodo anterior se desactive antes de comenzar la búsqueda
    if (buscandoNodo != null) {
      buscandoNodo!.buscando = false;
    }
    buscandoNodo = await _buscar(raiz, clave);
  }

  Future<Nodo?> _buscar(Nodo? nodo, int clave) async {
    int time = 1000;

    if (nodo == null)
      return null; 
  
    if (buscandoNodo != null) {
      buscandoNodo!.buscando = false;
    }

    await Future.delayed(Duration(milliseconds: time));
    actualizarEstado();
    actualizarEstado();
    
    nodo.buscando = true;
    buscandoNodo = nodo;

    await Future.delayed(Duration(milliseconds: time));
    actualizarEstado();
    actualizarEstado();
    if (clave.compareTo(nodo.clave) < 0) {
      
      return await _buscar(nodo.nodoIzquierdo, clave);
    } else if (clave.compareTo(nodo.clave) > 0) {
      
      return await _buscar(nodo.nodoDerecho, clave);
    } else {
      
      return nodo;
    }
  }

  void actualizarEstado() {
    mainKey.currentState?.cambiarEstado();
  }

  void _imprimirInOrden(Nodo? nodo) {
    if (nodo != null) {
      _imprimirInOrden(nodo.nodoIzquierdo);
      // ignore: avoid_print
      print('${nodo.clave} ');
      _imprimirInOrden(nodo.nodoDerecho);
    }
  }
}
