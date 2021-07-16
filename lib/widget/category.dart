import 'package:flutter/material.dart';


class CategoryWidget extends StatelessWidget {
   
 CategoryWidget({Key ?key, required this.index}) : super(key: key);
  final int index ;
   List<Map<String, Object>> categorias= [
    {
      'categoryName': 'phones',
      'categoryImagesPath': 'assets/images/Dell.jpg',
    },
    {
      'categoryName': 'phones',
      'categoryImagesPath': 'assets/images/Dell.jpg',
    },
    {
      'categoryName': 'phones',
      'categoryImagesPath': 'assets/images/Dell.jpg',
    }
  ];



  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //image: DecorationImage(image: AssetImage(categorias[index]['categoryImagesPath'])),
      ),
      
    );
  }
}
