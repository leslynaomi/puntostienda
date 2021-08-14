import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/provider/cart_provider.dart';
import 'package:puntotienda/provider/product_provider.dart';

class FeedsScreen extends StatefulWidget {
  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
//La lista de productos del carrito
  List<Widget> listWidgetCart = [];

  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance.collection("producto").get();
    // bool _isButtonDisabled = false;

    return Scaffold(
        body: FutureBuilder(
      future: db,
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasData == true) {
          if (snapshot.hasError == false) {
            List<Widget> listWidgetTemp = [];

            snapshot.data!.docs.forEach((data) {
              String imagen = (data.data()["imagen"]).toString();
              String nombre = (data.data()["nombre"]).toString();
              String precio = (data.data()["precio"]).toString();
              String stock = (data.data()["stock"]).toString();
              String categoria = (data.data()["categoria"]).toString();
              String descripcion = (data.data()["descripcion"]).toString();
              listWidgetTemp.add(cardProductFeed(context, imagen, nombre,
                  int.parse(precio), int.parse(stock),categoria,descripcion));
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
    ));
  }

  Widget cardProductFeed(BuildContext context, String imagen, String nombre,
      int precio, int stock,String categoria,String descripcion) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child:InkWell(
          onTap: () {
   Provider.of<ProductoProvider>(context, listen: false).changeUser(
                nombre,descripcion,precio.toString(),stock.toString(),categoria, imagen   );
              Navigator.popAndPushNamed(context, 'detalles');
          } ,
          child: Container(
            width: 250,
            height: 290,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).backgroundColor),
            child: Column(
              children: [
                imageProducto(context, imagen),
                detallesProducto(context, nombre, precio, imagen, stock),
              ],
            ),
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

  Widget detallesProducto(BuildContext context, String nombre, int precio,
      String imagen, int stock) {
    var opacidad = 1.0;
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
              precio.toString(),
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
                    onTap: () {
                       

                    },
                    borderRadius: BorderRadius.circular(18.0),
                    child: Opacity(
                      opacity: opacidad,
                      child: ElevatedButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .addProducToCart(nombre, precio, imagen);
                            print("Añadiendo al carrito");
                          },
                          /* Apagando el botón una vez pulsado para no añadir
                          el mismo producto 2 veces
                          sendProductToCart(context, nombre, precio, imagen), */
                          child: Text("Añadir",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}

bool _isButtonDisabled = false;

void Function()? sendProductToCart(
    BuildContext context, String nombre, int precio, String imagen) {
  if (_isButtonDisabled) {
    _isButtonDisabled = false;
    return null;
  } else {
    return () {
      //Mandando el producto al carrito vía provider
      Provider.of<CartProvider>(context, listen: false)
          .addProducToCart(nombre, precio, imagen);
      print("Añadiendo al carrito");
      
      _isButtonDisabled = true;
    };
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