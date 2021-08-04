// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsuarioSingUp extends ChangeNotifier {
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

// class UsuarioLogged extends ChangeNotifier {
//   String nombre;
//   String telefono;
//   String email;

//   UsuarioSingUp({this.nombre = "", this.telefono = "", this.email = ""});

//   get getNombre => this.nombre;

//   void setNombre(String nombre) => this.nombre = nombre;

//   get getTelefono => this.telefono;

//   void setTelefono(String telefono) => this.telefono = telefono;

//   get getEmail => this.email;

//   void setEmail(String email) => this.email = email;

//   void changeUser(String nombre, String telefono, String email) {
//     setNombre(nombre);
//     setTelefono(telefono);
//     setEmail(email);

//     //Notificamos a los oyentes
//     notifyListeners();
//   }
// }


// void insertar(TextEditingController nombre, TextEditingController email,
//     TextEditingController telefono, TextEditingController passw) {
//   FirebaseFirestore.instance.collection('usuarios').doc().set({
//     "nombre": nombre.text,
//     "email": email.text,
//     "teléfono": telefono.text,
//     "contraseña": passw.text,
//   }).then((_) {
//     nombre.clear();
//     email.clear();
//     telefono.clear();

//     passw.clear();
//   });
// }
