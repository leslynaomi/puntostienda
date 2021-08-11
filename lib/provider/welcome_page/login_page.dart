import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/methods/aviso.dart';
import 'package:puntotienda/widget/back_button.dart';

import '../user_provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/computer_world.jpg"),
                // NetworkImage(
                //     'https://images.pexels.com/photos/5217882/pexels-photo-5217882.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                child: backButton(context, Colors.white),
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
                            color: Colors.grey,
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
                          child: Text('¿Olvidó su contaseña?',
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
                            Text("¿No tiene una cuenta?",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0)),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'sign-up');
                              },
                              child: Container(
                                child: Text(' Registrate',
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
    );
  }
}

Widget _emailInput(TextEditingController emailController) {
  return Container(
    margin: EdgeInsets.only(top: 20.0),
    padding: EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput(TextEditingController passwordController) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: TextField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'password',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _buttonLogin(BuildContext context, TextEditingController emailController,
    TextEditingController passwordController) {
  return Container(
    width: 350.0,
    height: 45.0,
    margin: EdgeInsets.only(top: 10.0),
    child: ElevatedButton(
        onPressed: () async {Navigator.of(context).pushNamed('BottomBarScreen');
         /* if (await validarUser(emailController, passwordController)) {
            if (await esAdmin(emailController)) {
              Navigator.of(context).pushNamed('AreaAdmin');
            } else {
              Navigator.of(context).pushNamed('BottomBarScreen');

              String nameUser =
                  await obtenerNombreYApellidoUser(emailController.text);
              String phoneUser =
                  await obtenerTelefonoUser(emailController.text);
              print(nameUser);
              print(phoneUser);

              if (nameUser != "" && phoneUser != "") {
                Provider.of<UsuarioProvider>(context, listen: false)
                    .changeUser(nameUser, phoneUser, emailController.text);
              } else {
                await mostrarAviso(
                    context,
                    "El usuario no fue encontrado con la consulta obtener (Telefono) y (Nombre y Apellidos)",
                    "Revisa el código...");
              }
            }
          } else {
            await mostrarAviso(
                context,
                "No se encuentra el usuario en los registros",
                "Intentar de nuevo");
          }
        */},
        child: Text('iniciar sesion',
            style: TextStyle(color: Colors.white, fontSize: 17.0))),
  );
}

Future<String> obtenerTelefonoUser(String correo) async {
  String resultado = "";
  var db = FirebaseFirestore.instance.collection("usuario").get();
  await db.then((QuerySnapshot value) async => value.docs.forEach((doc) {
        if (doc["email"] == correo) {
          resultado = doc["teléfono"];
        }
      }));
  return resultado;
}

Future<String> obtenerNombreYApellidoUser(String correo) async {
  String resultado = "";
  var db = FirebaseFirestore.instance.collection("usuario").get();
  await db.then((QuerySnapshot value) async {
    value.docs.forEach((doc) {
      if (doc["email"] == correo) {
        resultado = doc["nombre"] + " " + doc["apellido"];
        print("Esto guarda resultado: " + resultado);
      }
    });
  });
  return resultado;
}

Future<bool> validarUser(TextEditingController emailController,
    TextEditingController passwordController) async {
  bool resultado = false;
  var db = FirebaseFirestore.instance.collection("usuario").get();

  await db.then((QuerySnapshot querySnapshot) async {
    querySnapshot.docs.forEach((doc) {
      if (emailController.text != "" && passwordController.text != "") {
        if (doc["email"] == emailController.text &&
            doc["contraseña"] == passwordController.text) {
          resultado = true;
        }
      } else {
        print("Ingrese un usuario válido");
        emailController.clear();
        passwordController.clear();
      }
      print(doc["email"]);
      print(doc["contraseña"]);
    });
  }, onError: (_) {
    print("Ocurrió un problema");
  });
  return resultado;
}

Future<bool> esAdmin(TextEditingController emailController) async {
  bool resultado = false;
  var db = FirebaseFirestore.instance.collection("usuario").get();

  await db.then((QuerySnapshot snapshot) => snapshot.docs.forEach((doc) {
        if ("jeanpaulflores2014@gmail.com" == emailController.text) {
          resultado = true;
        }
      }));
  return resultado;
}
