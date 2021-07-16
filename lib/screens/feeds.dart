import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:puntotienda/widget/feeds_products.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:   
         GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
           childAspectRatio: 240/290,
            children: List.generate(100, (index) {
              return FeedProducts();
           }),)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
     


          //  StaggeredGridView.countBuilder(
     
  //crossAxisCount: 6,
 /// itemCount: 8,
  //itemBuilder: (BuildContext context, int index) =>FeedProducts(),
 // staggeredTileBuilder: (int index) =>
 //     new StaggeredTile.count(3, index.isEven ? 4 : 5),
 // mainAxisSpacing: 8.0,
  //crossAxisSpacing: 6.0,
//)
        








          );
  }
}
