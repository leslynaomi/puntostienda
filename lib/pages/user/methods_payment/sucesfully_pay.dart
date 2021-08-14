import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/provider/cart_provider.dart';
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
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => (Colors.blue[300])),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "tabs");
                          Provider.of<CartProvider>(context, listen: false)
                              .emptyCart();
                          print("Ha finalizado la compra");
                        }),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
