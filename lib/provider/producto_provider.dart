import 'package:flutter/material.dart';
//<>[]{}
class Products with ChangeNotifier {

 
  void changeUser(String nombre, String telefono, String email) {
    
    //Notificamos a los oyentes
    notifyListeners();
  }
}
