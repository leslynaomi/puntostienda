// import 'package:after_layout/after_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:puntotienda/methods/database/conexion_firestore.dart';
// import 'package:puntotienda/src/model/product.dart';
// import 'package:puntotienda/src/model/size_db.dart';
import 'package:puntotienda/widget/feeds_products.dart';

class FeedsScreen extends StatefulWidget {
  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  @override
  Widget build(BuildContext context) {
    //Trayendo toda la colección de productos
    // FirestoreFunciones firestoreFunctions = FirestoreFunciones();
    // firestoreFunctions.obtenerRegistros("producto");
    // var mapaColeccion = firestoreFunctions.getMapCollection;

    //Lista de objetos de la clase de productos
    // List<Producto> listaProductos = [];

    //Pasando la lista de mapas a una lista de la clase Producto
    // for (int i = 0; i < mapaColeccion.length; i++) {
    //   listaProductos[i].fromMap(mapaColeccion[i]);
    // }

    // var mapaProductos = obtenerRegistros("producto").then((value) {
    //   for (int i = 0; i < value.length; i++) {
    //     listaProductos[i].fromMap(value[i]);
    //   }
    // });

    //Lista de productos de carrito de compras
    // List<Producto> _listaCarrito = [];

    //Cargando los documentos de la colección "producto"
    var db = FirebaseFirestore.instance.collection("producto").get();

    //Probando el paquete de AfterLayoutMixin
    // return HomeScreen1();

    return Scaffold(
        body: FutureBuilder(
      future: db,
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasData == true) {
          if (snapshot.hasError == false) {
            List<Widget> listWidgetTemp = [];

            snapshot.data!.docs.forEach((data) {
              
              //Para comprobar que lee los datos de la colección
              // print(data.data()["nombre"]);

              String imagen = (data.data()["imagen"]).toString();
              String nombre = (data.data()["nombre"]).toString();
              String precio = (data.data()["precio"]).toString();
              String stock = (data.data()["stock"]).toString();

              listWidgetTemp
                  .add(cardProductFeed(context, imagen, nombre, precio, stock));
            });

            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 240 / 290,
              children: listWidgetTemp,
            );
          } else {
            print("El snapshot contiene un error");
          }
        } else {
          print("El snapshot no contiene datos");
        }
        return CircularProgressIndicator();
      },

      //     GridView.builder(
      // padding: EdgeInsets.all(4.0),
      // gridDelegate:
      //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      // itemCount: 2,//listaProductos.length,
      // itemBuilder: (context, index) {
      //   final String nombre = listaProductos[index].nombre;
      //   // print(listaProductos.length);
      //   );
      // },
    ));
  }
}