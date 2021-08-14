import 'package:flutter/material.dart';

Widget doneButton(BuildContext context, String labelButton) {
  return Container(
    width: 350.0,
    height: 45.0,
    margin: EdgeInsets.only(top: 10.0),
    child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'login');
        },
        child: Text(labelButton,
            style: TextStyle(color: Colors.white, fontSize: 17.0))),
  );
}
