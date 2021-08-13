import 'package:flutter/material.dart';

class CartAttr with ChangeNotifier {
  String imagen = "";
  String nombre = "";
  int precio = 0;
  int cantidad = 0;

  CartAttr(
      {required this.imagen,
      required this.nombre,
      required this.precio,
      required this.cantidad});

  
    
}
