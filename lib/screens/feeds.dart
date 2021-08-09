import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/methods/database/conexion_firestore.dart';
import 'package:puntotienda/provider/producto_provider.dart';
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
    //var cantidad = 6;
    final productsProvider = Provider.of<Products>(context);

    List<Product> productsList = productsProvider.products;
    return Scaffold(
        body: FutureBuilder(
      future: obtenerProductos(),
      builder: (BuildContext context, AsyncSnapshot snapshot) => GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 240 / 420,
        children: List.generate(productsList.length, (index) {
          return ChangeNotifierProvider.value(
            value: productsList[index],
            child: FeedProducts(),
          );
        }),
      ),
    ));

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
  }
}

Future<Map<String, dynamic>> obtenerProductos() async {
  Map<String, dynamic> mapa = {};
  var db = FirebaseFirestore.instance.collection("producto").get();
  db.then((value) => value.docs.forEach((doc) {
        mapa.addAll(doc.data());
        // print(doc.data());
      }));
  return mapa;
}
