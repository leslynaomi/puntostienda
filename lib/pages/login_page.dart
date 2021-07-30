import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puntotienda/widget/back_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images-ext-1.discordapp.net/external/fx8f-1ELTP9Dp7rZeKifMN-8czL3-d9WSpxObST0RdM/https/i.pinimg.com/564x/61/2d/38/612d38034bb8ea4f566b0630e1c96f1d.jpg'),
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
        onPressed: () async {
          var result = validarUser(emailController, passwordController);
          if (await result) {
            Navigator.of(context).pushNamed('BottomBarScreen');
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
        child: Text('iniciar sesion',
            style: TextStyle(color: Colors.white, fontSize: 17.0))),
  );
}

Future<bool> validarUser(TextEditingController emailController,
    TextEditingController passwordController) async {
  bool resultado = false;
  var db = FirebaseFirestore.instance.collection("usuario").get();

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

//Recorriendo y buscando en toda una colección con QuerySnapShot
 //Lo mismo pero con "For in"
  // await db.then((QuerySnapshot querySnapshot){
  //   for (var doc in querySnapshot.docs) {
  //     print(doc["email"]);
  //     print(doc["contraseña"]);

  //     if (doc["email"] == emailController.text &&
  //         doc["contraseña"] == passwordController.text) {
  //       resultado = true;
  //       print("funcionó la consulta men");
  //       print(resultado);
  //     }
  //   }

//Mostrando datos con un FutureBuilder (es un widget)
// FutureBuilder<DocumentSnapshot>(
//     future: db.doc("documentId").get(),
//     builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//       if (snapshot.hasError) {
//         print("Algo salió mal, error");
//       }

//       if (snapshot.hasData && !snapshot.data!.exists) {
//         print("El documento no existe");
//       }

//       if (snapshot.connectionState == ConnectionState.done) {
//         Map<String, dynamic> data =
//             snapshot.data!.data() as Map<String, dynamic>;
//         email = data['email'];
//         password = data['password'];

//         if (email == emailController.text &&
//             password == passwordController.text) {
//           print("Usuario encontrado!");
//           resultado = true;
//         }
//         //return Text("Usuario: ${data['nombre']} y Contraseña: ${data['password']}");
//       }
//     },
//   );

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Algo salió mal, error");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("El documento no existe");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}
