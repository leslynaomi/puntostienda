import 'package:flutter/material.dart';
class BrandsNavigationRail extends StatelessWidget {
  const BrandsNavigationRail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(left: 5.0,right: 5.0),
        margin: EdgeInsets.only(right: 20.0,bottom: 5, top: 18),
        constraints: BoxConstraints(
          minHeight: 150, minWidth: double.infinity,maxHeight: 180
        ),
        child: Row(
          children: <Widget>[
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                image: DecorationImage(image: NetworkImage('https://www.acerstore.cl/news/wp-content/uploads/2020/08/p-nciespwa.jpg.jpeg'),)
              ),
            ))
          ],
        ),

      ),
    );
  }
}