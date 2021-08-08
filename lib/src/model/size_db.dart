import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreFunciones {
  int lenght = 0;
  List<Map<String, dynamic>> mapCollection = [];

  //Setters y getters
  int get getLenght => this.lenght;
  void setLenght(int lenght) => this.lenght = lenght;

  get getMapCollection => this.mapCollection;
  void setMapCollection(mapCollection) => this.mapCollection = mapCollection;

  //Constructor
  // FirestoreFunciones(this.lenght, this.mapCollection);

  //Método para conseguir la cantidad de los documentos en un "Stream<QuerySnapshot<Map<String, dynamic>>>"
  Future<void> getLenghtDB(Future<int> size) async {
    setLenght(await size);
    // int a = length as int;
    // return a;
  }

  //Obtener/Robar Registros de Firestore en una lista de mapas
  Future<void> obtenerRegistros(String coleccion) async {
    List<Map<String, dynamic>> mapa = [];
    var db = FirebaseFirestore.instance.collection(coleccion).get();
    await db.then((value) async {
      value.docs.forEach((doc) async {
        mapa.add(doc.data());
      });
    });
    setMapCollection(mapa);
  }
}
