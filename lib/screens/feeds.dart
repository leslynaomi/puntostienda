import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:puntotienda/widget/feeds_products.dart';

class FeedsScreen extends StatefulWidget {
  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  @override
  Widget build(BuildContext context) {
    //Reemplazar por la cantidad de productos a obtener
    var cantidad = 8;
    
    return Scaffold(
        body: FutureBuilder(
          future: obtenerProductos(),
      builder: (BuildContext context, AsyncSnapshot snapshot) => 
      GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 240 / 290,
        children: List.generate(cantidad, (index) {
          return FeedProducts();
        }),
      ),

    ));
  }
}

// class mostrarProducto extends StatelessWidget {
//   const mostrarProducto({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (BuildContext context, int index) {
//         return FeedProducts();
//       },
//     );
//   }
// }

Future<Map<String,dynamic>> obtenerProductos() async{
  Map<String,dynamic>mapa = {};
  var db = FirebaseFirestore.instance.collection("productos").get();
  db.then(
      (value) => value.docs.forEach((doc) {
        mapa.addAll(doc.data());
        // print(doc.data());
      }));
  return mapa;
}
