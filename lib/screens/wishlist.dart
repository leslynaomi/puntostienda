//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:puntotienda/consts/colors.dart';
//import 'package:puntotienda/database/productos.dart';
import 'package:puntotienda/widget/wishlist_empty.dart';
import 'package:puntotienda/widget/wishlist_full.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // final cartProvider = Provider.of(context)<CartProvider>(context);
   // List products = [];
         List wishlisList=[];


    return wishlisList.isNotEmpty
        ? Scaffold(body: wishlistEmpty())
        : Scaffold(
            
           
            appBar:AppBar(
              title: Text('Lista de deseos'),
            ),
            body: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context , int index){
                return WishlistFull();
              }),
            );
  }

}

