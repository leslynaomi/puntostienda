import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:flutter_icons/flutter_icons.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      width: 250,
      decoration: BoxDecoration(
      color: Theme.of(context).backgroundColor,
      borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(10.0),
      bottomRight: Radius.circular(10.0)
      )),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),   
             ),


        
          onTap: (){},
          child: Column(
            children: [
              Stack(children: [
                Container(
                  
                  height: 170,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                  image:NetworkImage('https://i.blogs.es/4fda57/screenshot_4125/450_1000.jpeg'),
                fit:BoxFit.fill )),),
                Positioned(right:12,
                top: 7,
                child: Icon(Entypo.star,
                color: Colors.grey.shade800,),),
                 Positioned(right:10,
                top: 7,
                child: Icon(Entypo.star_outlined,
                  color: Colors.white,),),
                 Positioned(right:12,
                bottom:32.0 ,
                child:Container(padding:EdgeInsets.all(10.0),
                color:Theme.of(context).backgroundColor ,
                child:Text('Bs 12.2', style: TextStyle(color: Theme.of(context).textSelectionColor),
                ),
                
                ) ,),
             
              ],
              ),
              Container(padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                         Text('Title',maxLines:1,
                         style:TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                         
                         ),
                         Row(
                           //mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                           children: [
                            Text('Description',maxLines:2,
                            overflow: TextOverflow.ellipsis,
                         style:TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500,color: Colors.grey[800]),
                         
                         ),
                         Spacer(),
                         Material(
                           color: Colors.transparent,
                           child:InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(30.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(MaterialCommunityIcons.cart_plus,
                                size: 25,
                                color: Colors.black,
                                ),
                              ),
                         ),)
                         ],)
        
                ],
              ),)
            ],
        
          ),
        ),
      ),
      ),
    );
  }
}