import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:puntotienda/methods/database/conexion_firestore.dart';
//import 'package:puntotienda/provider/producto_provider.dart';

class FeedProducts extends StatefulWidget {
  @override
  _FeedProductsState createState() => _FeedProductsState();
}
class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
   /// final productsAtribbutes = Provider.of<Products>(context);
   // final productsAtribbutes = Provider.of<Product>(context);
   // final productId = ModalRoute.of(context)!.settings.arguments as String;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.popAndPushNamed(context, 'detalles'
           /*/ arguments: productsAtribbutes.products*/
           // arguments: productsAtribbutes.products
           ),
        child: Container(
          width: 250,
          height: 290,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).backgroundColor),
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                              minHeight: 100,
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.3),
                          child: Image.network(
                            //haremos la carga de imagen aqui
                          /*  productsAtribbutes.imagen*/'https://p4.wallpaperbetter.com/wallpaper/696/641/249/anime-noragami-nora-noragami-yato-noragami-wallpaper-preview.jpg',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Positioned(
                        //bottom: 0,
                        // right: 5,
                        child: Badge(
                          alignment: Alignment.center,
                          toAnimate: true,
                          shape: BadgeShape.square,
                          badgeColor: Colors.pink,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8)),
                          badgeContent: Text('Nuevo',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text('descripcion'
                      /*tomamos de provider la descripcion revisa a
                      iniciode estewidget/// productsAtribbutes.descripcion*/,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('bs'
                        /*'Bs ${productsAtribbutes.precio}'*/,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('stock'
                         /* '${productsAtribbutes.stock}'*/,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(18.0),
                            child: Icon(
                              Icons.more_horiz,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}









/*import 'dart:async';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/consts/constantes.dart' as contador;
import 'package:puntotienda/provider/product_provider.dart';

class FeedProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance.collection("producto").snapshots();

    return ChangeNotifierProvider(
      create: (_) => ProductoProvider(),
      child: StreamBuilder<QuerySnapshot>(
        stream: db,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              if (snapshot.hasData) {
                //Retraso para la carga de productos y la
                //ejecución del provider
                Timer(const Duration(seconds: 3), () {
                  obtenerProducto(context, snapshot, contador.index);
                  if (contador.index < snapshot.data!.size + 1 ) {
                    contador.index = contador.index + 1;
                  } 
                });

                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 250,
                      height: 290,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Theme.of(context).backgroundColor),
                      child: Column(
                        children: [
                          imageProducto(context),
                          detallesProducto(context),
                        ],
                      ),
                    ));
              } else {
                print("No hay datos en el snapshot");
                return CircularProgressIndicator();
              }
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.done:
              print("Conexión efectuada");
              break;
            case ConnectionState.none:
              if (snapshot.hasError) {
                print("Error en la conexión a firestore" +
                    "${snapshot.error.toString()}");
              }
              print("Conexión no efectuada");
              break;
            default:
              print("Proceso default del switch");
              return CircularProgressIndicator();
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Future<void> obtenerProducto(
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

Widget imageProducto(BuildContext context) {
  return Column(
    children: [
      Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                  minHeight: 100,
                  maxHeight: MediaQuery.of(context).size.height * 0.3),
              child: SizedBox(
                height: 0.5,
                width: 0.5,
                child: Image.network(
                  //La imagen del producto
                  Provider.of<ProductoProvider>(context).getImagen,
                  fit: BoxFit.fitWidth,
                  // fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            //bottom: 0,
            // right: 5,
            child: Badge(
              alignment: Alignment.center,
              toAnimate: true,
              shape: BadgeShape.square,
              badgeColor: Colors.pink,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(8)),
              badgeContent:
                  Text('Nuevo', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget detallesProducto(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 5),
    margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 4,
        ),
        Text(
          Provider.of<ProductoProvider>(context).getDescripcion,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            Provider.of<ProductoProvider>(context).getPrecio,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w900),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Provider.of<ProductoProvider>(context).getStock,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(18.0),
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}*/
