import 'package:flutter/material.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:puntotienda/widget/feeds_products.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    //Reemplazar por la cantidad de productos a obtener
    var cantidad = 6;

    return Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 240 / 290,
          children: List.generate(cantidad, (index) {
            return FeedProducts();
          }),
      ));
  }
}
