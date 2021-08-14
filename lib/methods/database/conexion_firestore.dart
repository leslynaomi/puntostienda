import 'package:cloud_firestore/cloud_firestore.dart';

//Insertar Registros de Firestore
void insertarRegistros(String coleccion, Map<String, dynamic> registros) {
  FirebaseFirestore db = FirebaseFirestore.instance;
  db
      .collection(coleccion)
      .add(registros)
      .then((value) => print("Register Added"))
      .catchError((error) => print("Failed to add register: $error"));
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

//        Apuntes
//Añadiendo todo el contenido del documento en un mapa
//mapa.addAll(doc.data());

//Imprimir en pantalla todos los documentos al recorrer la colección
// print(doc.data());
