import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

//import 'package:carousel_pro/carousel_pro.dart';
//import 'package:backdrop/sub_header.dart';
import 'package:flutter/material.dart';

import 'package:puntotienda/consts/colors.dart';
import 'package:puntotienda/consts/horizontalwidget.dart';
//import 'package:puntotienda/widget/category.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imageList = [
    "https://images.pexels.com/photos/2582937/pexels-photo-2582937.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "https://images.pexels.com/photos/3568520/pexels-photo-3568520.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "https://images.pexels.com/photos/163140/technology-computer-motherboard-chips-163140.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/1714340/pexels-photo-1714340.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
  ];

  final List<String> brandImages = [
    "https://images.pexels.com/photos/47261/pexels-photo-47261.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "https://images.pexels.com/photos/3568520/pexels-photo-3568520.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "https://images.pexels.com/photos/3066/smartphone-mockup-mobile-phone-screen.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BackdropScaffold(
          headerHeight: MediaQuery.of(context).size.height * 0.25,
          appBar: BackdropAppBar(
            title: Text("Home"),
            leading: BackdropToggleButton(
              icon: AnimatedIcons.home_menu,
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                ColorsConst.starterColor,
                ColorsConst.endColor
              ])),
            ),
            actions: <Widget>[
              IconButton(
                iconSize: 15,
                padding: const EdgeInsets.all(10),
                icon: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/5872171/pexels-photo-5872171.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'),
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
          backLayer: Center(
            child: Text("Back Layer"),
          ),
          frontLayer: SingleChildScrollView(
              child: Column(
              children: [
                SizedBox(
                  height: 190.0,
                  width: double.infinity,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      // enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                    items: imageList
                        .map((e) => ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                fit: StackFit.expand,
                                children: <Widget>[
                                  Image.network(
                                    e,
                                    width: 1050,
                                    height: 350,
                                    fit: BoxFit.cover,
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Categorias',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                ),
                Container(
                  height: 210,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: SizedBox(
                    height: 190.0,
                    width: double.infinity,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: false,
                        autoPlayAnimationDuration: Duration(milliseconds: 1000),
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        // enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: brandImages
                          .map((e) => ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children:   [LisCategoria(),] 
                                  
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Marcas Populares',
                        style:
                            TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Ver todo...',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 210,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: SizedBox(
                    height: 190.0,
                    width: double.infinity,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 1000),
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        // enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: brandImages
                          .map((e) => ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: <Widget>[
                                    Image.network(
                                      e,
                                      width: 1050,
                                      height: 350,
                                      fit: BoxFit.fill,
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
