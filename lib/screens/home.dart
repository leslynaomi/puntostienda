import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'package:carousel_pro/carousel_pro.dart';
//import 'package:backdrop/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:puntotienda/consts/colors.dart';
class HomeScreen extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: BackdropScaffold(
        headerHeight: MediaQuery.of(context).size.height*0.25,
        appBar: BackdropAppBar(
          title: Text("Home"),
          leading: BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration( gradient:  LinearGradient(colors:[ColorsConst.starterColor,ColorsConst.endColor])),
          ),
          actions: <Widget>[
          IconButton( iconSize:15,
          padding: const EdgeInsets.all(10),
          icon: CircleAvatar(radius: 15,
          backgroundColor: Colors.white,
          child:CircleAvatar(radius: 13,
          backgroundImage: NetworkImage('https://images.pexels.com/photos/5872171/pexels-photo-5872171.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'),
          ) ,
          ), onPressed: () {  },)
          ],
        ),
        backLayer: Center(
          child: Text("Back Layer"),
        ),

        frontLayer: SizedBox(
          height: 150.0,
          width: 300.0,
          child: Carousel(
            boxFit: BoxFit.cover,
            autoplay: false,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1000),
            dotSize: 6.0,
            dotIncreasedColor: Color(0xFFFF335C),
            dotBgColor: Colors.transparent,
            dotPosition: DotPosition.topRight,
            dotVerticalPadding: 10.0,
            showIndicator: true,
            indicatorBgPadding: 7.0,
            images: [
              NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
              NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
              ExactAssetImage("assets/images/LaunchImage.jpg"),
            ],
          ),
      ),

      ),),
    );
  }

}