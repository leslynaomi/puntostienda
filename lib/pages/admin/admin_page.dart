//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:puntotienda/widget/fondo_pantalla.dart';

class Administracion extends StatelessWidget {
  //const Administracion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Administración"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                margin: EdgeInsets.all(1.5),
                child: ListTile(
              title: Text("Menú de Productos"),
              onTap: () {
                Navigator.pushNamed(context, "Productos");
              },
            )),
            DrawerHeader(
                child: ListTile(
              title: Text("Menú de Categoría"),
              onTap: () {
                Navigator.pushNamed(context, "Categoria");
              },
            )),
          ],
        ),
      ),
      body: Stack(children: [
        fondopantalla(context),
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Panel de Administracion",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "¡Bienvenido!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ])
      ]),
    );
  }
}
