import 'package:flutter/material.dart';
import 'package:puntotienda/consts/colors.dart';



class WishlistFull extends StatefulWidget {
  WishlistFull({Key? key}) : super(key: key);

  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  @override
  Widget build(BuildContext context) {
    return Stack(
       children: <Widget>[
         Container(
           width: double.infinity,
           margin: EdgeInsets.only(right: 30.0, bottom: 10.0),
           child: Material(
             color: Theme.of(context).backgroundColor,
             borderRadius: BorderRadius.circular(5.0),
             elevation: 3.0,
             child: InkWell(
               onTap: (){},
               child: Container(
                 padding: EdgeInsets.all(16.0),
                 child: Row(
                   children: <Widget>[
                     Container(
                       height: 80,
                       child: Image.network(
                         'https://s3.amazonaws.com/mercado-ideas/wp-content/uploads/sites/2/2019/08/28111559/Bigstock-marcas-de-computadoras.jpg'
                       ),
                       
                     ),
                     SizedBox(
                       width: 10.0,
                     ),
                     Expanded(child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text('title',style: TextStyle(
                           fontSize: 16.0,fontWeight: FontWeight.bold
                         ),),
                         SizedBox(
                           height: 20.0,
                         ),
                         Text("Bs 16",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),

                       ],
                     ))
                   ],
                 ),
               ),
             ),
           ),
         ),
         positionedRemove(),
       ],
    );
  }
}

Widget positionedRemove(){
  return Positioned(
    top: 20,
    right: 15,
    child: Container(
      height: 30,
      width: 30,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        padding: EdgeInsets.all(0.0),
        color: ColorsConst.favColor,
        child: Icon(Icons.clear,color: Colors.white,),
        onPressed: (){},
        

      ),
    ),
  );
}