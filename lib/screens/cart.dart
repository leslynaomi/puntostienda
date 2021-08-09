//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/consts/colors.dart';
import 'package:puntotienda/provider/cart_provider.dart';
//import 'package:puntotienda/database/productos.dart';
import 'package:puntotienda/widget/cart_empty.dart';
import 'package:puntotienda/widget/cart_full.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of(context)<CartProvider>(context);
   // List products = [];



    return cartProvider.getCartItems.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            bottomSheet: checkoutSection(context),
            appBar: AppBar(
              title: Text('Recuento de articulos del carrito'),
              actions: [
                IconButton(
                  onPressed: () /*async*/ {
                    // Productos prod = new Productos();
                    // var aux = prod.db;
                    // aux = asMap();

                    print('Soy el botón de eliminar todos los productos');
                  },
                  icon: Icon(Icons.delete),
                )
              ],
            ),
            //body: Container(
              //margin: EdgeInsets.only(bottom: 60),
              //child: ListView.builder(
                //  itemCount: cartProvider.getCartItems.lenght,
                  //itemBuilder: (BuildContext context, int index) {
                 //   return ChangeNotifierProvider.value(
                   //   value: cartProvider.getCartItems.values.toList()[index],
                    //      child: CartFull(
                        // imagen:cartProvider.getCartItems.values.toList()[index].imagen,
                   // nombre :cartProvider.getCartItems.values.toList()[index].nombre,
                   // precio :cartProvider.getCartItems.values.toList()[index].precio,
                   // cantidad :cartProvider.getCartItems.values.toList()[index].cantidad,
                     // ),
               //     );
                 // }),
           // )
            );
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
