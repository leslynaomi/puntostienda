import 'package:flutter/material.dart';

Widget categoryWidget(BuildContext context, String categoria, String imagen) {
  //final CategoryAtribbutes = Provider.of<Category>(context);
  return Stack(
    children: [
      InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
              'cartproducts' /* para mostrar dato  Categoriafeedscreen,arguments:$categories[widget.index]['nombre del atributo']*/);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(image: NetworkImage(imagen), fit: BoxFit.cover),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 150,
        ),
      ),
      Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: Theme.of(context).backgroundColor,

            ///añadir el provider nombre de cateforia
            child: Text(categoria,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white)),
          ))
    ],
  );
}
