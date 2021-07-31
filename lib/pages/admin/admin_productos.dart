//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:puntotienda/database/conexion_firestore.dart';
import 'package:puntotienda/methods/aviso.dart';
import 'package:puntotienda/widget/buttons/text_field.dart';
// import 'package:puntotienda/pages/login_page.dart';
import 'package:puntotienda/widget/fondo_pantalla.dart';
// import 'package:puntotienda/widget/text_field.dart';

class AdminProductos extends StatelessWidget {
  // const Productos({Key? key}) : super(key: key);
  final productController = TextEditingController();
  final descripcionController = TextEditingController();
  final precioController = TextEditingController();
  final stockController = TextEditingController();
  final categoriaController = TextEditingController();
  final imagenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        fondopantalla(context),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Inserción de Productos",
              style: TextStyle(
                color: Colors.white,
                fontSize: 27,
              ),
            ),
            textfield(productController, "Nombre del producto"),
            textfield(descripcionController, "Descripción"),
            textfield(precioController, "Precio"),
            textfield(stockController, "Stock"),
            textfield(categoriaController, "Categoria"),
            textfield(imagenController, "Imagen"),
            TextButton(
              onPressed: () async {
                Map<String, dynamic> registros = {
                  "nombre": productController.text,
                  "descripcion": descripcionController.text,
                  "precio": precioController.text,
                  "stock": stockController.text,
                  "categoria": categoriaController.text,
                  "imagen": imagenController.text,
                };
                if (productController.text.isNotEmpty &&
                    descripcionController.text.isNotEmpty &&
                    precioController.text.isNotEmpty &&
                    stockController.text.isNotEmpty &&
                    categoriaController.text.isNotEmpty &&
                    imagenController.text.isNotEmpty) {
                  insertarRegistros("producto", registros);
                  productController.clear();
                  descripcionController.clear();
                  precioController.clear();
                  stockController.clear();
                  categoriaController.clear();
                  imagenController.clear();
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
