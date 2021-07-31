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
// Future <Map<String, dynamic>> mostrarRegistros(String coleccion) async{
  
//   var db = FirebaseFirestore.instance.collection(coleccion).get();
//   Map<String, dynamic> consultaMap;
  
//   await db.then((QuerySnapshot querySnapshot){
//     querySnapshot.docs.forEach((doc){
//       print(doc[0]);
//     });
//   }); 
//     // {
//     //10 registros por ahora
//     // consultaMap = event.docs[10].data();
//     // print(event.docs[10].data());
//   // });
  

//   //Retornamos la consulta
//   return consultaMap;
// }