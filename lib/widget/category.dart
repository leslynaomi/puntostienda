import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key, required this.index}) : super(key: key);
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
    return Stack(
      children: [
        InkWell(
          onTap: () {
          Navigator.of(context).pushNamed('cartproducts',arguments: '${categories[widget.index]['categoryName']}');
            
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(categories[widget.index]['categoria']),
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
              child: Text(categories[widget.index]['categoryName'],
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Theme.of(context).textSelectionColor)),
            ))
      ],
    );
  }
}
