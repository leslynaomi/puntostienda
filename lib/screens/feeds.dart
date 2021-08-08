import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:puntotienda/methods/database/conexion_firestore.dart';
import 'package:puntotienda/src/model/product.dart';
import 'package:puntotienda/src/model/size_db.dart';
import 'package:puntotienda/widget/feeds_products.dart';

class FeedsScreen extends StatefulWidget {
  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  @override
  Widget build(BuildContext context) {
    //Reemplazar por la cantidad de productos a obtener
    // var cantidad = FirebaseFirestore.instance.collection("producto").snapshots().length;

    //Trayendo toda la colección de productos
    FirestoreFunciones firestoreFunctions = FirestoreFunciones();
    firestoreFunctions.obtenerRegistros("producto");
    var mapaColeccion = firestoreFunctions.mapCollection;

    //
    List<Producto> listaProductos = [];

    for (int i = 0; i < mapaColeccion.length; i++) {
      // for (var item in mapaColeccion) {
        listaProductos[i].fromMap(mapaColeccion[i]);
      // }
    }

    List<Producto> _listaCarrito = [];

    var db = FirebaseFirestore.instance.collection("producto").snapshots();

    return Scaffold(
        body: GridView.builder(
      padding: EdgeInsets.all(4.0),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: listaProductos.length,
      itemBuilder: (context, index) {
        final String nombre = listaProductos[index].nombre;

        return Card(
          elevation: 4.0,
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              Column(
                children: [],
              )
            ],
          ),
        );
      },
    )

        // GridView.count(
        //     crossAxisCount: 2,
        //     crossAxisSpacing: 8,
        //     mainAxisSpacing: 8,
        //     childAspectRatio: 240 / 290,
        //     children: [
        //   ListView(),
        // ])

        // List.generate(10, (index) {

        //   print(index);
        //   return cardProductFeed(context,db2,index);
        // }),

        // [
        //   FeedProducts(),

        // FeedProducts(),
        // FeedProducts(),
        // FeedProducts(),
        // FeedProducts(),
        // FeedProducts(),
        // FeedProducts(),
        // FeedProducts(),
        // FeedProducts(),
        // FeedProducts(),
        // ],

        // children: ()[
        // ]
        // ));

        //Con FutureBuilder
        // return Scaffold(
        //     body: FutureBuilder(
        //   future: obtenerProductos(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot) => GridView.count(
        //     crossAxisCount: 2,
        //     crossAxisSpacing: 8,
        //     mainAxisSpacing: 8,
        //     childAspectRatio: 240 / 290,
        //     children: List.generate(cantidad, (index) {
        //       return FeedProducts();
        //     }),
        //   ),
        // ));
        );
  }
}

// Future<Map<String, dynamic>> obtenerProductos() async {
//   Map<String, dynamic> mapa = {};
//   var db = FirebaseFirestore.instance.collection("producto").get();
//   db.then((value) => value.docs.forEach((doc) {
//         mapa.addAll(doc.data());
//         // print(doc.data());
//       }));

//   // db2.then((value) => value.docs.forEach((doc) {
//   //   ;
//   // });

//   return mapa;
// }
