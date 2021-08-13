import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/consts/colors.dart';
import 'package:puntotienda/provider/cart_provider.dart';
import 'package:puntotienda/src/model/CartAttr.dart';
// import 'package:puntotienda/src/model/product.dart';
import 'package:puntotienda/widget/cart_empty.dart';
import 'package:puntotienda/widget/cart_full.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Producto aux = Producto(nombre: "hola");
  // int cantidad = 0;

  @override
  Widget build(BuildContext context) {
    //Obteniendo los items del carrito de compras
    Map<String, CartAttr> cartItems =
        Provider.of<CartProvider>(context).getCartItems;

    //Lista de los Widgets que se muestran en el carrito de compras
    List<Widget> listWidgetsLocal =
        Provider.of<CartProvider>(context, listen: false).getListWidgetTemp;

    //Cargando los elementos del carrito a la lista de widgets como cardProduct
    
    cartItems.forEach((key, value) {
      
      //Si el producto no está en la lista de widgets entonces no debe ser agregado de nuevo
      // if (validarValue(listWidgetsLocal, value)) {
        listWidgetsLocal.add(CartFull(
            nombre: value.nombre,
            imagen: value.imagen,
            precio: value.precio,
            cantidad: value.cantidad));
      // }
      // monto = calcularSubTotal(value.cantidad, value.precio);
      // total = calcularTotal(int.parse(monto));
    });

    //Mandando la lista de widgets actualizada al provider
    Provider.of<CartProvider>(context, listen: false)
        .setListWidgetTemp(listWidgetsLocal);

    if (cartItems.isNotEmpty) {
      return Scaffold(
          bottomSheet: checkoutSection(context, cartItems),
          appBar: appBarArticulos(context),
          body: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView(
                  children:
                      Provider.of<CartProvider>(context).getListWidgetTemp)
              // child: ListView(children: listWidgetTemp)

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
  double montoTotal = Provider.of<CartProvider>(context).getTotalAcumulado;

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
            (montoTotal).toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}



// String calcularSubTotal(int cantidad, int precio) {
//   int subtotal = cantidad * precio;
//   return subtotal.toString();
// }

// String calcularTotal(int subtotal) {
//   int suma = 0;
//   suma = suma + subtotal;
//   return suma.toString();
// }
