import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';

class Producto {
  String nombre;
  String descripcion;
  String precio;
  String stock;
  String categoria;
  String imagen;

  Producto(
      {this.nombre = "",
      this.descripcion = "",
      this.precio = "",
      this.stock = "",
      this.categoria = "",
      this.imagen = ""});

  Producto.fromJson(Map<String, dynamic> json)
      : this(
          nombre: json['nombre']! as String,
          descripcion: json['descripcion']! as String,
          precio: json['precio']! as String,
          stock: json['stock']! as String,
          categoria: json['categoria']! as String,
          imagen: json['imagen']! as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'stock': stock,
      'categoria': categoria,
      'imagen': imagen
    };
  }

//Future<void> mostrarDatos() async {

//}

  Future<void> main() async {
    var db = FirebaseFirestore.instance
        .collection('productos')
        .withConverter<Producto>(
          fromFirestore: (snapshot, _) => Producto.fromJson(snapshot.data()!),
          toFirestore: (productos, _) => productos.toJson(),
        );
    // Obtain science-fiction movies
    // List<QueryDocumentSnapshot<Productos>> coleccion = await db
    //     //.where('genre', isEqualTo: 'Sci-fi')
    //     .get()
    //     .then((snapshot) => snapshot.docs);

    // Add a movie
    await db.add(
      Producto(
          nombre: 'nombre',
          descripcion: 'descripcion',
          precio: 'precio',
          stock: 'stock',
          categoria: 'categoria',
          imagen: 'imagen'),
    );

    // Get a movie with the id 42
    // Productos consulta =
    //     await db.doc('42').get().then((snapshot) => snapshot.data()!);
  }
}
