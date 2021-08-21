import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
// import 'package:fancy_dialog/FancyAnimation.dart';
// import 'package:fancy_dialog/FancyGif.dart';
// import 'package:fancy_dialog/FancyTheme.dart';
// import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/provider/cart_provider.dart';
import 'package:puntotienda/provider/user_provider.dart';
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
                        }),
                    TextButton(
                        child: Text(
                          'Ver detalle en Whatsapp',
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
                          Navigator.pushNamed(context, "tabs");
                          Provider.of<CartProvider>(context, listen: false).emptyCart();
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
    String nombre = Provider.of<UsuarioProvider>(context, listen: false).getNombre;
    String fecha = (DateTime.now()).toString();
    nota = nota + "Fecha:" + fecha;
    nota = nota + "\n";
    nota = nota + "¡FoundMart Compre con nosotros!";
    nota = nota + "\n";
    nota = nota + "Cliente: " + nombre;
    nota = nota + "\n";
    nota = nota + "______________";
    nota = nota + "\n";
    Map<String, CartAttr> aux = Provider.of<CartProvider>(context, listen: false).getCartItems;

    aux.forEach((key, value) {
      nota = nota +
          "\n" +
          "Nombre de producto: " +
          "\n" +
          value.nombre +
          "\n" +
          "Precio: " +
          (value.precio).toString() +
          "\n" +
          "Cantidad: " +
          (value.cantidad).toString() +
          "\n";
    });
    nota = nota +
        "___________________" +
        "\n"
            "Total:" +
        (Provider.of<CartProvider>(context, listen: false).getTotalAcumulado).toString();
    
    await launch("https://wa.me/59176358244?text=$nota");
    
    //Número del ing
    // await launch("https://wa.me/59178115911?text=$nota");
  }
}
