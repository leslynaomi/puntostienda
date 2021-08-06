import 'package:flutter/material.dart';

Widget textfield(TextEditingController controller, String texto) {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
        color: Colors.white,//.withOpacity(2.5),
        borderRadius: BorderRadius.circular(30.0)
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: texto,
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}