import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
// import 'package:fancy_dialog/FancyAnimation.dart';
// import 'package:fancy_dialog/FancyGif.dart';
// import 'package:fancy_dialog/FancyTheme.dart';
// import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/provider/cart_provider.dart';
import 'package:puntotienda/src/model/CartAttr.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:kussa/widgets/buy_button.dart';

class PagoExitoso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: BounceInLeft(
                duration: Duration(seconds: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¡Pago exitoso!',
                      style: TextStyle(
                        color: Colors.teal[400],
                        fontSize: 30,
                      ),
                    ),
                    TextButton(
                        child: Text(
                          'Finalizar',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) => (Colors.blue[300])),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "tabs");
                          Provider.of<CartProvider>(context, listen: false).emptyCart();
                          // print("Ha finalizado la compra");
                        }),
                    TextButton(
                        child: Text(
                          'Ver detalle de compra en Whatsapp',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) => (Colors.green[300])),
                        ),
                        onPressed: () async {
                          await msgNotaCompra(context);

                          // showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) => CupertinoAlertDialog(
                          //           title: Text("Felicidades por su compra"),
                          //           actions: <Widget>[
                          //             CupertinoDialogAction(
                          //               isDefaultAction: true,
                          //               child: Text("Ver detalle en Whatsapp"),
                          //               onPressed: () async {
                          //                 await msgNotaCompra(context);
                          //                 Navigator.of(context).pop();
                          //               },
                          //             ),
                          //           ],
                          //         ));

                          Navigator.pushNamed(context, "tabs");
                          Provider.of<CartProvider>(context, listen: false).emptyCart();
                          print("Ha finalizado la compra");
                        }),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Future<void> msgNotaCompra(BuildContext context) async {
    String nota = "";
    String fecha = (DateTime.now()).toString();
    nota = nota + "Fecha:" + fecha;
    nota = nota + "\n";
    nota = "¡Compre con nosotros!";
    nota = nota + "\n";
    nota = "Cliente: Flutter - Dart";
    nota = nota + "\n";
    nota = nota + "______________";

    Map<String, CartAttr> aux = Provider.of<CartProvider>(context, listen: false).getCartItems;

    aux.forEach((key, value) {
      nota = value.nombre +
          "\n" +
          (value.precio).toString() +
          "\n" +
          value.imagen +
          "\n" +
          (value.cantidad).toString() +
          "\n" +
          "___________________";
    });
    nota = nota +
        "Total:" +
        (Provider.of<CartProvider>(context, listen: false).getTotalAcumulado).toString();

    await launch("https://wa.me/59176358244?text=$nota");
  }
}
