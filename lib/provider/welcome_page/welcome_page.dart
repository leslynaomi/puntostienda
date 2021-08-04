import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puntotienda/consts/header_text.dart';
import 'package:puntotienda/widget/fondo_pantalla.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
    return Scaffold(
      body: Stack(
        children: [
          fondopantalla(context),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: headerText('FOUNDMART',
                    Colors.white, FontWeight.bold, 45.0),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
                child: Text('Mucho más que una tienda de computadoras',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0)),
              ),
              Container(
                width: 350.0,
                height: 45.0,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('login');
                    },
                    // shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
                    //color: Theme.of(context).accentColor,
                    child: Text('Iniciar Sesión',
                        style: TextStyle(color: Colors.white, fontSize: 15.0))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
