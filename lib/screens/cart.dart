//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:puntotienda/consts/colors.dart';
//import 'package:puntotienda/database/productos.dart';
import 'package:puntotienda/widget/cart_empty.dart';
import 'package:puntotienda/widget/cart_full.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var products = [];

    return products.isNotEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            bottomSheet: checkoutSection(context),
            appBar: AppBar(
              title: Text('Recuento de articulos del carrito'),
              actions: [
                IconButton(
                  onPressed: () {
                    // Productos prod = new Productos();
                    // var aux = prod.db;
                    // aux = asMap();
                    var db =
                        FirebaseFirestore.instance.collection("producto").get();
                    

                    db.then((value) async {
                      value.docs.forEach((doc) async {
                        print (doc.id);
                    
                      });
                    
                    });

                    print('Soy el botón de eliminar todos los productos');
                  },
                  icon: Icon(Icons.delete),
                )
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return CartFull();
                  }),
            ));
  }

  Widget checkoutSection(BuildContext ctx) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    ColorsConst.gradiendLStart,
                    ColorsConst.gradiendLEnd,
                  ], stops: [
                    0.0,
                    0.7
                  ]),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'verificar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              'Total: ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Bs 179.0',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
