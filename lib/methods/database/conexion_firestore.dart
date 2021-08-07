import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
//import 'package:puntotienda/provider/producto_provider.dart';
//import 'package:puntotienda/pages/admin/admin_productos.dart';

//Insertar Registros de Firestore
void insertarRegistros(String coleccion, Map<String, dynamic> registros) {
  FirebaseFirestore db = FirebaseFirestore.instance;
  db
      .collection(coleccion)
      .add(registros)
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

//Modificar Registros de Firestore
void modificarRegistros(
    String coleccion, String idRegistro, Map<String, dynamic> registros) {
  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection(coleccion).doc(idRegistro).set(registros);
}

//Eliminar Registros de Firestore
void eliminarRegistros(String coleccion, String idRegistro) {
  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection(coleccion).doc(idRegistro).delete();
}

//Obtener/Robar Registros de Firestore en una lista de mapas
Future<List<Map<String, dynamic>>> obtenerRegistros(String coleccion) async {
  List<Map<String, dynamic>> mapa = [];
  var db = FirebaseFirestore.instance.collection(coleccion).get();
  await db.then((value) async {
    value.docs.forEach((doc) async {
      mapa.add(doc.data());
    });
  });
  return mapa;
}



class Product with ChangeNotifier {
  String categoria = "";
  String descripcion = "";
  String imagen = "";
  String nombre = "";
  String precio = "";
  String stock = "";

  Product(
      {required this.categoria,
      required this.descripcion,
      required this.imagen,
      required this.nombre,
      required this.precio,
      required this.stock});
}
class Category with ChangeNotifier {

  String nombre = "";
 

  Category(
      {
     
      required this.nombre,
    });
}

class CartAttr with ChangeNotifier {
 String imagen = "";
   String nombre = "";
 int precio = 0;
   int cantidad = 0;

CartAttr(
      {
   
      required this.imagen,
      required this.nombre,
      required this.precio,
      required this.cantidad});
}
//        Apuntes
//Añadiendo todo el contenido del documento en un mapa
//mapa.addAll(doc.data());

//Imprimir en pantalla todos los documentos al recorrer la colección
// print(doc.data());
