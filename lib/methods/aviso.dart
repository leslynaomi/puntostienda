import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future mostrarAviso(BuildContext context, String aviso, String mensaje) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text(aviso),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(mensaje),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
}