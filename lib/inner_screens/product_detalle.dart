//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/provider/product_provider.dart';

class Productodetalles extends StatefulWidget {
  @override
  _ProductodetallesState createState() => _ProductodetallesState();
}

class _ProductodetallesState extends State<Productodetalles> {
  GlobalKey previewContainer = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    //final productsData = Provider.of<Products>(context);
    //final productId = ModalRoute.of(context)!.settings.arguments as String;
    //final prodAttr = productsData.findById(productId);
    //final cartProvider = Provider.of(context)<CartProvider>(context);
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          foregroundDecoration: BoxDecoration(color: Colors.black12),
          height: MediaQuery.of(context).size.height * 0.45,
          width: double.infinity,
          child: Image.network(Provider.of<ProductoProvider>(context).getImagen),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.purple.shade200,
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Icon(Icons.save, size: 23, color: Colors.white),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.purple.shade200,
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Icon(Icons.share, size: 23, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Text(Provider.of<ProductoProvider>(context).getNombre
                             /* llamada prodAttr.nombre*/,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Bs'+Provider.of<ProductoProvider>(context).getPrecio
                          /* 'bs ${prodAttr.precio} '*/,
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 21.0),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(Provider.of<ProductoProvider>(context).getDescripcion
                       /*llamada  prodAttr.descripcion*/,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 21.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 1,
                      ),
                    ),
                    _details('Stock  :',Provider.of<ProductoProvider>(context).getStock /*'${prodAttr.stock}'*/),
                    _details('Categoria  :', Provider.of<ProductoProvider>(context).categoria/*prodAttr.categoria*/),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "DETALLES",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.badge,
                    color: Colors.purple,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('carrito');
                  },
                )
              ],
            ))
       
      ]),
    );
  }
}

Widget _details(String title, String info) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 21.0),
        ),
        Text(
          info,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 20.0, color: Colors.grey),
        ),
      ],
    ),
  );
}
