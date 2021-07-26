
import 'package:flutter/material.dart';
import 'package:puntotienda/consts/back_button.dart';
import 'package:puntotienda/consts/header_text.dart';

class SignUpPage extends StatelessWidget {
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
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                headerText('Crear una cuenta', Theme.of(context).primaryColor,
                    FontWeight.bold, 25.0),
                _username(context),
                _userapellido(context),
                _phoneInput(context),
                _emailInput(context),
                _passwordInput(context),
                _signUpButton(context)
              ],
            ),
          ),
        ));
  }
}

Widget _username(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'nombres',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _userapellido(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _emailInput(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'telf',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _phoneInput(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: 'usuario',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 15.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _signUpButton(BuildContext context) {
  return Container(
    width: 350.0,
    height: 45.0,
    margin: EdgeInsets.only(top: 30.0),
    child: ElevatedButton(
        onPressed: () {},
        //shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        // color: Theme.of(context).accentColor,
        child: Text('crear',
            style: TextStyle(color: Colors.white, fontSize: 17.0))),
  );
}
