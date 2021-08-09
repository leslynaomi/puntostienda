import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:puntotienda/methods/database/conexion_firestore.dart';

//<>[]{}
class Products with ChangeNotifier {
  List<Product> _products = [];

  Future<void> imageList() async {
    await FirebaseFirestore.instance
        .collection('producto')
        .get()
        .then((QuerySnapshot categoriasSnapshot) {
      _products = [];
      categoriasSnapshot.docs.forEach((element) {
        _products.insert(
          0,
          Product(
            categoria: element.get('categoria'),
            descripcion: element.get('descripcion'),
            imagen: element.get('imagen'),
            nombre: element.get('nombre'),
            precio: element.get('precio'),
            stock: element.get('stock'),
          ),
        );
      });
    });
  }

  //List<Product> findByCategory(String categoryName) {
    //List _categoryList = _products.where((element) => element.categoria
      //      .toLowerCase()
        //    .contains(categoryName.toLowerCase()))
        //.toList();
  //  return _categoryList;
 // }

  List<Product> get products {
    return [..._products];
  }

  Product findById(String productoid) {
    return _products.firstWhere((element) => element.nombre == productoid);
  }
}

void changeUser(String nombre, String telefono, String email) {
  //Notificamos a los oyentes
  //notifyListeners();
}
