import 'dart:async';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/provider/cart_provider.dart';
import 'package:puntotienda/provider/product_provider.dart';

// class FeedProducts extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var db = FirebaseFirestore.instance.collection("producto").snapshots();

//     return StreamBuilder<QuerySnapshot>(
//       stream: db,
//       builder: (context, snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.active:
//             if (snapshot.hasData) {
//               // return cardProductFeed(context,db,index);
//               return CircularProgressIndicator();
//             } else {
//               print("No hay datos en el snapshot");
//               return CircularProgressIndicator();
//             }
//           case ConnectionState.waiting:
//             return CircularProgressIndicator();
//           case ConnectionState.done:
//             print("Conexión efectuada");
//             break;
//           case ConnectionState.none:
//             if (snapshot.hasError) {
//               print("Error en la conexión a firestore" +
//                   "${snapshot.error.toString()}");
//             }
//             print("Conexión no efectuada");
//             break;
//           default:
//             print("Proceso default del switch");
//             return CircularProgressIndicator();
//         }
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }


Future<void> actualizarCardProduct(
    BuildContext context, var snapshot, int index) async {
  Provider.of<ProductoProvider>(context, listen: false).changeUser(
    (snapshot.data!.docs.elementAt(index).get("nombre")).toString(),
    (snapshot.data!.docs.elementAt(index).get("descripcion")).toString(),
    (snapshot.data!.docs.elementAt(index).get("precio")).toString(),
    (snapshot.data!.docs.elementAt(index).get("stock")).toString(),
    (snapshot.data!.docs.elementAt(index).get("categoria")).toString(),
    (snapshot.data!.docs.elementAt(index).get("imagen")).toString(),
  );
}


//APUNTES
// print("snapshot.data");
// print(snapshot);

//Imprimiendo todos los documentos de la coleccion
// print(snapshot.data!.docs);

//Mostrando algunos documentos en consola
// print(snapshot.data!.docs[0].data());
// print(snapshot.data!.docs[1].data());

//Cantidad de documentos en una coleccion
//print(snapshot.data!.docs.length);

              //Retraso para la carga de productos y la
              //ejecución del provider

              // Timer(const Duration(seconds: 3), () {
              // actualizarCardProduct(context, snapshot, contador.index);
              // contador.index = contador.index + 1;

              // if (contador.index < snapshot.data!.size + 1) {
              //   contador.index = contador.index + 1;
              // }
              // });
