import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puntotienda/consts/header_text.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://previews.123rf.com/images/nicolasmenijes/nicolasmenijes1601/nicolasmenijes160100078/50761723-3d-ilustraci%C3%B3n-estetoscopio-p%C3%ADldoras-y-botiqu%C3%ADn-de-primeros-auxilios-concepto-de-la-medicina-fondo-blanco-a.jpg'))),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: headerText('Ofrecemos algo más allá de la medicación',
                    Colors.white, FontWeight.bold, 45.0),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
                child: Text(
                    'La medicación es solo un dispositivo que ofrecemos a nuestras administraciones y una consideración extraordinaria hacia el paciente.',
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
                    child: Text('log in',
                        style: TextStyle(color: Colors.white, fontSize: 15.0))),
              ),
             
            ],
          )
        ],
      ),
    );
  }
}
