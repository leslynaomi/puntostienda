/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:puntotienda/methods/database/conexion_firestore.dart';
import 'package:puntotienda/provider/producto_provider.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:puntotienda/widget/feeds_products.dart';

class CategoriesFeedsScreen extends StatefulWidget {
  @override
  _CategoriesFeedsScreenState createState() => _CategoriesFeedsScreenState();
}

class _CategoriesFeedsScreenState extends State<CategoriesFeedsScreen> {
  @override
  Widget build(BuildContext context) {
    //Reemplazar por la cantidad de productos a obtener
    //var cantidad = 6;
    final productsProvider = Provider.of<Products>(context,listen: false);
    final categoryName = ModalRoute.of(context)!.settings as String;
 //   final productsList = productsProvider.findByCategory(categoryName);
    return Scaffold(
        body: FutureBuilder(
      future: obtenerProductos(),
      builder: (BuildContext context, AsyncSnapshot snapshot) => GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 240 / 420,
     //   children: List.generate(productsList.length, (index) {
   //       return ChangeNotifierProvider.value(
            value: productsList[index],
            child: FeedProducts(),
          );
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

Future<Map<String, dynamic>> obtenerProductos() async {
  Map<String, dynamic> mapa = {};
  var db = FirebaseFirestore.instance.collection("productos").get();
  db.then((value) => value.docs.forEach((doc) {
        mapa.addAll(doc.data());
        // print(doc.data());
      }));
  return mapa;
}*/
