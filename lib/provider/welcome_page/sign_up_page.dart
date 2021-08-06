import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/methods/database/conexion_firestore.dart';

// import 'package:puntotienda/database/conexion_firestore.dart';
import 'package:puntotienda/widget/back_button.dart';
import 'package:puntotienda/widget/header_text.dart';

import '../user_provider.dart';

class SignUpPage extends StatelessWidget {
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final telefonoController = TextEditingController();
  final emailController = TextEditingController();
  final passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Builder(builder: (BuildContext context) {
            return backButton(context, Colors.black);
          }),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                headerText('Crear una cuenta', Theme.of(context).primaryColor,
                    FontWeight.bold, 25.0),
                _username(context, nombreController),
                _userapellido(context, apellidoController),
                _phoneInput(context, telefonoController),
                _emailInput(context, emailController),
                _passwordInput(context, passwdController),
                _signUpButton(context, nombreController, apellidoController,
                    telefonoController, emailController, passwdController)
              ],
            ),
          ),
        ));
  }
}

Widget _username(BuildContext context, TextEditingController nombreController) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      controller: nombreController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Nombre',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _userapellido(
    BuildContext context, TextEditingController apellidoController) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      controller: apellidoController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Apellido',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _emailInput(
    BuildContext context, TextEditingController emailController) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _phoneInput(
    BuildContext context, TextEditingController telefonoController) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      controller: telefonoController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: 'Teléfono',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput(
    BuildContext context, TextEditingController passwdController) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      controller: passwdController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _signUpButton(
    BuildContext context,
    TextEditingController nombreController,
    TextEditingController apellidoController,
    TextEditingController telefonoController,
    TextEditingController emailController,
    TextEditingController passwdController) {
  return Container(
    width: 350.0,
    height: 45.0,
    margin: EdgeInsets.only(top: 30.0),
    child: ElevatedButton(
        onPressed: () {
          Map<String, dynamic> registros = {
            "nombre": nombreController.text,
            "apellido": apellidoController.text,
            "teléfono": telefonoController.text,
            "email": emailController.text,
            "contraseña": passwdController.text
          };
          Provider.of<UsuarioSingUp>(context, listen: false).changeUser(
              nombreController.text + apellidoController.text,
              telefonoController.text,
              emailController.text);

          insertarRegistros("usuario", registros);
          Navigator.pushNamed(context, "login");
        },
        child: Text('Crear cuenta',
            style: TextStyle(color: Colors.white, fontSize: 17.0))),
  );
}
