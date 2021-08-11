//import 'dart:js';

import 'package:flutter/material.dart';
///import 'package:provider/provider.dart';
import 'package:puntotienda/consts/colors.dart';
//import 'package:puntotienda/provider/cart_provider.dart';
//import 'package:puntotienda/provider/producto_provider.dart';

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
          child: Image.network('https://i.pinimg.com/736x/61/18/42/61184274134f8d9592ac3ca0ffc26fb5.jpg'/* llamada del provider para añadir imagen prodAttr.imagen*/),
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
                            child: Text('nombre producto'
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
                          Text('precio'
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
                      child: Text('descripcion'
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
                    _details('Stock','30' /*'${prodAttr.stock}'*/),
                    _details('id_Categoria', 'televisores'/*prodAttr.categoria*/),
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
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: /*cartProvider.getCartItems.constainsKey(productId)?(){}:() {
                      cartProvider.addProductToCart(
                         prodAttr.nombre, prodAttr.precio, prodAttr.imagen);
                    */(){},
                    child: Text(/*cartProvider.getCartItems.constainsKey(productId)?'In cart':
                      'add to cart'.toUpperCase(),
                      style: TextStyle(fontSize: 16, color: Colors.black),*/
                    'cargaa carrito '),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed:(){},
                    /*
                    cargando carrito en provider
                     cartProvider.getCartItems.constainsKey(productId)?(){}:() {
                      cartProvider.addProductToCart(
                         prodAttr.nombre, prodAttr.precio, prodAttr.imagen);*/
                    
                    child: Row(
                      children: [
                      Text(/* añadiendo a carrito
                      cartProvider.getCartItems.constainsKey(productId)?'In cart':*/
                      'comprar ahora'.toUpperCase(),
                      style: TextStyle(fontSize: 14, color: Theme.of(context).textSelectionColor),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                      Icon(Icons.payment,
                      color: Colors.green.shade700,
                      size: 19,)

                      ],

                    ),
                    
                    
                  ),
                ),
              ),

               Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  child: InkWell(
                    splashColor: ColorsConst.favColor,
                    onTap: (){},
                    child: Center(
                      child: Icon(Icons.favorite,color: ColorsConst.white,),
                    ),
                  ),
                  
                ),
              ),
            ],
          ),
        )
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
