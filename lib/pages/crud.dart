//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

int insertar(
    TextEditingController nombre,
    TextEditingController email,
    TextEditingController telefono,
 
    TextEditingController passw) {
  int sw = 0;
  if (sw == 0) {
    FirebaseFirestore.instance.collection('user').doc().set({
      "nombre": nombre.text,
      "email": email.text,
      "teléfono": telefono.text,
    
      "contraseña": passw.text,
    }).then((_) {
      nombre.clear();
      email.clear();
      telefono.clear();
   
      passw.clear();
    });
    sw = 1;

    return sw;
  } else {
    return sw;
  }
}

