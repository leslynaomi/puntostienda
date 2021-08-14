import 'package:flutter/cupertino.dart';
import 'package:puntotienda/src/model/nota_compra.dart';

class NotaCompraProvider with ChangeNotifier {
  //Instancia de la clase NotaCompra
  NotaCompra notaCompra = NotaCompra();

  // Getters y Setters
  get getNotaCompra => this.notaCompra;
  void setNotaCompra(NotaCompra notaCompra) {
    this.notaCompra = notaCompra;
    notifyListeners();
  }

  // //Datos del usuario
  // String nameUser = "";
  // String email = "";
  // String telefono = "";

  // //Datos de los productos
  // // String nameProduct = "";
  // // int cantidad = 0;

  // //Datos de la tarjeta de débito
  // String nameBank = "";
  // String numberCard = "";
  // String month = "";
  // String year = "";
  // String numberCVV = "";

  // //Datos de la nota
  // double total = 0;
  // DateTime fecha = DateTime.now();
}
