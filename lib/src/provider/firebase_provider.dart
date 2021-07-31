import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String nombre = 'lesly genius';
  String email = 'lesly@gmail.com';
  String telefono = '70058903';
  void changeUser(String newuser, String newemail, String newtelefono) {
    nombre = newuser;
    email = newemail;
    telefono = newtelefono;
    notifyListeners();
  }
}
