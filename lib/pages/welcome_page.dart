//import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:puntotienda/widget/fondo_pantalla.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        fondopantalla(context),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text('FOUNDMART',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 45.0)),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 53.0, vertical: 30.5),
              child: Text('Mucho más que una tienda de computadoras',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0)),
            ),

            //Botón Iniciar Sesión
            ElevatedButton(
              child: Text('Iniciar Sesión'),
              onPressed: () {
                // Navigator.of(context).push('login');
                Navigator.pushNamed(context, 'login');
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    ));
  }
}
