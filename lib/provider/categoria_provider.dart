import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:puntotienda/methods/database/conexion_firestore.dart';

class Categories with ChangeNotifier {
  List<Category> _categoria = [];
  List<Category> get categoria {
    return [..._categoria];
  }

  Future<void> imageList() async {
    await FirebaseFirestore.instance
        .collection('categoria')
        .get()
        .then((QuerySnapshot categoriasSnapshot) {
      _categoria = [];
      categoriasSnapshot.docs.forEach((element) {
        _categoria.insert(
          0,
          Category(
            nombre: element.get('nombre'),
            imagen:element.get('imagen'),
          ),
        );
      });
    });
  }
}
