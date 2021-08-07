import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  int total = 0;

  get getTotal => this.total;
  void setTotal(int total) => this.total = total;

  void changeUser(int total) {
    setTotal(total);

    //Notificamos a los oyentes
    notifyListeners();
  }
}