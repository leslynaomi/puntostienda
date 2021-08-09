import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/methods/database/conexion_firestore.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key, required this.index}) ;
 final  int index ;
  List<Map<String, Object?>> categories = [
    {
      'categoryName': 'telefonos',
      'categoryImage': 'assets/images/addidas.jpg',
    },
    {
      'categoryName': 'computadoras',
      'categoryImage': 'assets/images/addidas.jpg',
    },
    {
      'categoryName': 'ssd',
      'categoryImage': 'assets/images/addidas.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
   final CategoryAtribbutes = Provider.of<Category>(context);
    return Stack(
      children: [
        InkWell(
          onTap: () {
          Navigator.of(context).pushNamed('cartproducts',arguments: '${CategoryAtribbutes.nombre}');
            
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage('CategoryAtribbutes.imagen'),
                  fit: BoxFit.cover),
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
              child: Text(CategoryAtribbutes.nombre,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Theme.of(context).textSelectionColor)),
            ))
      ],
    );
  }
}
