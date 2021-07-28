import 'package:cloud_firestore/cloud_firestore.dart';

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

//Mostrar Registros de Firestore
Map<String, dynamic>? mostrarRegistros(String coleccion) {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Map<String, dynamic>? consultaMap;

  db.collection(coleccion).snapshots().listen((event) {
    //10 registros por ahora
    consultaMap = event.docs[10].data();
    print(event.docs[10].data());
  });

  //Retornamos la consulta
  return consultaMap;
}

  //Ejemplo de Gerardo de consulta avanzada
  // FirebaseFirestore _db = FirebaseFirestore.instance;
  //     dato = _db.collection('pacientes')
  //     .where("name", isEqualTo: name)
  //     .snapshots().listen((event) {
  //     print(event.docs[0].data());
  //     paciente = event.docs[0].data();
  // });
