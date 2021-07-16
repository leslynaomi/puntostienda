import 'package:flutter/material.dart';
import 'package:puntotienda/widget/alert_dialog.dart';
import 'package:puntotienda/widget/back_button.dart';
import 'package:puntotienda/widget/done_button.dart';
import 'package:puntotienda/widget/header_text.dart';

class ForgotPassword extends StatelessWidget {
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
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              headerText('Se te olvido tu contraseña',
                  Theme.of(context).primaryColor, FontWeight.bold, 25.0),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    'por favor ingrese su dirección de correo electrónico. recibirá un enlace para crear una nueva contraseña por correo electrónico ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0)),
              ),
              _emailInput(),
              _sendButton(context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _emailInput() {
  return Container(
    margin: EdgeInsets.only(top: 20.0),
    padding: EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'your Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _sendButton(BuildContext context) {
  return Container(
    width: 350.0,
    height: 45.0,
    margin: EdgeInsets.only(top: 30.0),
    child: ElevatedButton(
        onPressed: () {
          _showAlertta(context);
        },
        // shape:
        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        // color: Theme.of(context).accentColor,
        child: Text('enviar',
            style: TextStyle(color: Colors.white, fontSize: 17.0))),
  );
}

void _showAlertta(BuildContext context) {
  showAlertDialog(
      context,
      AssetImage('imagenes/lock.jpg'),
      'tu contraseña a sido restablecida',
      'En breve recibirá un correo electrónico con un código para configurar una nueva contraseña.',
      doneButton(context, "Done"));
}
