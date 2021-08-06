import 'package:flutter/material.dart';
// import 'package:puntotienda/database/conexion_firestore.dart';
import 'package:puntotienda/methods/aviso.dart';
import 'package:puntotienda/methods/database/conexion_firestore.dart';
import 'package:puntotienda/widget/buttons/text_field.dart';
import 'package:puntotienda/widget/fondo_pantalla.dart';

class AdminCategoria extends StatelessWidget {
  //const Categoria({Key? key}) : super(key: key);
  final categoriaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        fondopantalla(context),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Inserción de Categoría",
              style: TextStyle(
                color: Colors.white,
                fontSize: 27,
              ),
            ),
            textfield(categoriaController, "Nombre de la categoría"),
            TextButton(
              onPressed: () async {
                Map<String, dynamic> registros = {
                  "categoria": categoriaController.text,
                };
                if (categoriaController.text.isNotEmpty) {
                  insertarRegistros("categoria", registros);
                  categoriaController.clear();
                } else {
                  await mostrarAviso(context, "Debe ingresar datos", "Aceptar");
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.green[800]),
                child: Text(
                  "Guardar",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
