import 'package:flutter/material.dart';
import 'dart:ui';

Widget fondopantalla(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(
          "https://tse4.mm.bing.net/th?id=OIP.KWC8ieJrAQ0UV6SD0Ei3NgHaO0&pid=15.1"),
    )),
    child: BackdropFilter(
        filter: ImageFilter.blur(),
        child: Container(
          color: Colors.black.withOpacity(0.3),
        )),
  );
}