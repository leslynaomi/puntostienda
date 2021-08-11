import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {

  List<Widget> listWidgetTemp = [];
  // int cantidad = 0;

  get getListWidgetTemp => this.listWidgetTemp;
  void setListWidgetTemp(listWidgetTemp) =>
      this.listWidgetTemp = listWidgetTemp;

  // get getCantidad => this.cantidad;
  // void setCantidad(int cantidad) => this.cantidad = cantidad;

  void changeCart(/*int cantidad,*/List<Widget> listWidgetTemp) {
    // setCantidad(cantidad);
    setListWidgetTemp(listWidgetTemp);
    
    //Notificamos a los oyentes
    notifyListeners();
  }
}
