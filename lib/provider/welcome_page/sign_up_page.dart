//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:puntotienda/consts/back_button.dart';
import 'package:puntotienda/consts/header_text.dart';
import 'package:puntotienda/pages/crud.dart';
//import 'package:puntotienda/pages/crud.dart';

class SignUpPage extends StatelessWidget {
  final nombreController = TextEditingController();
  final emailController = TextEditingController();
  final telefonoController = TextEditingController();
  final passwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Builder(builder: (BuildContext context) {
            return backbutton(context, Colors.black);
          }),
        ),
        body: new SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                headerText('Crear una cuenta', Theme.of(context).primaryColor,
                    FontWeight.bold, 25.0),
                _username(context, nombreController),
                _email(context, emailController),
                _telf(context, telefonoController),
             
                _passwordInput(context, passwdController),
                _signUpButton(context, nombreController, emailController,
                    telefonoController, passwdController)
              ],
            ),
          ),
        ));
  }
}

Widget _username(BuildContext context, TextEditingController uController) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      controller: uController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'nombres',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _email(BuildContext context, TextEditingController uController) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      controller: uController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _telf(BuildContext context, TextEditingController uController) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      controller: uController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: 'telf',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}



Widget _passwordInput(BuildContext context, TextEditingController uController) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      controller: uController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _signUpButton(
    BuildContext context,
    TextEditingController nombre,
    TextEditingController email,
    TextEditingController telefono,
    TextEditingController passw) {
  return Container(
    width: 350.0,
    height: 45.0,
    margin: EdgeInsets.only(top: 30.0),
    child: ElevatedButton(
        onPressed: () {
          int ig= insertar(nombre, email, telefono, passw);

          if(ig == 1){
             Navigator.of(context).pushNamed('login');
          }

          else{
            Navigator.of(context).pushNamed('sign-up');
          }
         
        },
        //shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        // color: Theme.of(context).accentColor,

        child: Text('crear',
            style: TextStyle(color: Colors.white, fontSize: 17.0))),
  );
}
