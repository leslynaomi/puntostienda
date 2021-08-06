import 'package:flutter/material.dart';

Widget elevatedbuttonpush(BuildContext context,String textbutton,String route) {
  return Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              primary: Colors.lightBlue[900]),
          child: Text(
            textbutton,
            style: TextStyle(color: Colors.white),
          ),  
          onPressed: () {
            Navigator.pushNamed(context, route);
          }));
}