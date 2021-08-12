import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:puntotienda/methods/database/conexion_firestore.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key, required this.index}) ;
 final  int index ;


  @override
  Widget build(BuildContext context) {
   //final CategoryAtribbutes = Provider.of<Category>(context);
    return Stack(
      children: [
        InkWell(
          onTap: () {
          Navigator.of(context).pushNamed('cartproducts'/* para mostrar dato  Categoriafeedscreen,arguments:$categories[widget.index]['nombre del atributo']*/);
            
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage('https://preview.redd.it/6dz6yc5l6fs61.png?width=1024&format=png&auto=webp&s=0f09f38b95f4022d44a5bb94a6ef24b825a450bd'),
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
              ///añadir el provider nombre de cateforia
              child: Text('titulo',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white)),
            ))
      ],
    );
  }
}
