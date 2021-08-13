import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/consts/colors.dart';
import 'package:puntotienda/provider/cart_provider.dart';
import 'package:puntotienda/src/model/CartAttr.dart';
import 'package:puntotienda/src/model/product.dart';
import 'package:puntotienda/widget/cart_empty.dart';
import 'package:puntotienda/widget/cart_full.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Producto aux = Producto(nombre: "hola");
  // int cantidad = 0;
  List<Widget> listWidgetTemp = [];

  @override
  Widget build(BuildContext context) {
    Map<String, CartAttr> cartItems =
        Provider.of<CartProvider>(context).getCartItems;

    cartItems.forEach((key, value) {
      listWidgetTemp.add(cardProduct(
          context, value.nombre, value.imagen, value.precio, value.cantidad));
    });

    if (cartItems.isNotEmpty) {
      return Scaffold(
          bottomSheet: checkoutSection(context, cartItems),
          appBar: appBarArticulos(context),
          body: Container(
            margin: EdgeInsets.only(bottom: 60),
            child: ListView(
              children: listWidgetTemp
            )
            // ListView.builder(
            //     itemCount: 6,
            //     itemBuilder: (BuildContext context, int index) {
            //       // return CartFull();
            //       return cardProduct(
            //           context,
            //           "Mando de PS3",
            //           "https://images.pexels.com/photos/326501/pexels-photo-326501.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            //           345,
            //           5);
            //     }),
          ));
    } else {
      return Scaffold(body: CartEmpty());
    }
  }
}

AppBar appBarArticulos(BuildContext context) {
  return AppBar(
    title: Text('Recuento de articulos del carrito'),
    actions: [
      IconButton(
        onPressed: () {
          Provider.of<CartProvider>(context, listen: false).emptyCart();
          print('Se han vaciado todos los productos del carrito');
        },
        icon: Icon(Icons.delete),
      )
    ],
  );
}

Widget checkoutSection(BuildContext context, Map<String, CartAttr> cartItems) {
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
                  onTap: () {
                    Navigator.pushNamed(context, "card_debit");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Verificar Orden',
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
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            precioTotal(cartItems),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}

String precioTotal(cartItems) {
  //La suma y multiplicación de las cantidades
  return "";
}
