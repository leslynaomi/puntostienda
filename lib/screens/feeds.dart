// import 'package:after_layout/after_layout.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/provider/cart_provider.dart';
// import 'package:puntotienda/widget/feeds_products.dart';

class FeedsScreen extends StatefulWidget {
  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
//La lista de productos del carrito
  List<Widget> listWidgetCart = [];

  @override
  Widget build(BuildContext context) {
    //Cargando los documentos de la colección "producto"
    var db = FirebaseFirestore.instance.collection("producto").get();

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

  Widget cardProductFeed(BuildContext context, String imagen, String nombre,
      String precio, String stock) {
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
              imageProducto(context, imagen),
              detallesProducto(context, nombre, precio, stock),
            ],
          ),
        ));
  }

  Widget imageProducto(BuildContext context, String imagen) {
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
                    imagen,
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
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(8)),
                badgeContent:
                    Text('Nuevo', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget detallesProducto(
      BuildContext context, String nombre, String precio, String stock) {
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
            // Provider.of<ProductoProvider>(context).getDescripcion,
            nombre,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              // Provider.of<ProductoProvider>(context).getPrecio,
              precio,
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
              Text(
                // Provider.of<ProductoProvider>(context).getStock,
                "Cantidad: " + "$stock",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Material(
                color: Colors.cyan,
                child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(18.0),
                    child: ElevatedButton(
                      onPressed: () {

                        Provider.of<CartProvider>(context, listen: false)
                            .changeCart(listWidgetCart);
                        print("Añadiendo al carrito");
                        
                        //Apagar el botón una vez se añade el producto al carrito
                        setState(() {
                          
                        });
                      },
                      child: Text("Añadir",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18)))),
              )
            ],
          )
        ],
      ),
    );
  }
}

//APUNTES
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