//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:puntotienda/consts/Colrs.dart';
import 'package:puntotienda/consts/back_button.dart';

//import 'package:provider/provider.dart';
//import 'package:puntotienda/pages/crud.dart';
//import 'package:puntotienda/src/repository/auth_repository.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));

    return Scaffold(
        body: new SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.pexels.com/photos/5217882/pexels-photo-5217882.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: backbutton(context, Colors.white),
                )
              ],
            ),
            Transform.translate(
              offset: Offset(0.0, -20.0),
              child: Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text("Bienvenido",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                        Text("iniciar sesion en su cuenta",
                            style: TextStyle(
                              color: gris,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                            )),
                        _emailInput(emailController),
                        _passwordInput(passwordController),
                        _buttonLogin(
                            context, emailController, passwordController),
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'forgot-password');
                            },
                            child: Text('olvido su contaseña?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.0)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("no tiene una cuenta?",
                                  style: TextStyle(
                                      color: gris,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, 'sign-up');
                                },
                                child: Container(
                                  child: Text('Registrate',
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.0)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

Widget _emailInput(TextEditingController controller) {
  return Container(
    margin: EdgeInsets.only(top: 20.0),
    padding: EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'User',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput(TextEditingController controller) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'password',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _buttonLogin(BuildContext context, TextEditingController controller,
    TextEditingController controllerp) {
  return Container(
    width: 350.0,
    height: 45.0,
    margin: EdgeInsets.only(top: 10.0),
    child: ElevatedButton(
        onPressed: () async {
          
          var result = validarUser(controller, controllerp);
          if (await result) {
            Navigator.of(context).pushNamed('tabs');
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                      title: Text("Usuario no registrado"),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          child: Text("Volver a intentar"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ));
          }
        },
        // shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        // color: Theme.of(context).accentColor,
        child: Text('iniciar sesion',
            style: TextStyle(color: Colors.white, fontSize: 17.0))),
  );
}

Future<bool> validarUser(TextEditingController emailController,
    TextEditingController passwordController) async {
  bool resultado = false;
  var db = FirebaseFirestore.instance.collection("user").get();

  await db.then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print(doc["email"]);
      print(doc["contraseña"]);

      if (doc["email"] == emailController.text &&
          doc["contraseña"] == passwordController.text) {
        resultado = true;
        print("funcionó la consulta men");
        print(resultado);
      }
    });
  });
  return resultado;
}





