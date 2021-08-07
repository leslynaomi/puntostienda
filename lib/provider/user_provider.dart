import 'package:flutter/material.dart';

class UsuarioProvider extends ChangeNotifier {
  String nombre = "";
  String telefono = "";
  String email = "";

  //UsuarioSingUp({this.nombre = "", this.telefono = "", this.email = ""});

  get getNombre => this.nombre;

  void setNombre(String nombre) => this.nombre = nombre;

  get getTelefono => this.telefono;

  void setTelefono(String telefono) => this.telefono = telefono;

  get getEmail => this.email;

  void setEmail(String email) => this.email = email;

  void changeUser(String nombre, String telefono, String email) {
    setNombre(nombre);
    setTelefono(telefono);
    setEmail(email);

    //Notificamos a los oyentes
    notifyListeners();
  }
}
