import 'package:flutter/material.dart';
import 'package:puntotienda/widget/whis_list/wishlist_empty.dart';
import 'package:puntotienda/widget/whis_list/wishlist_full.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final cartProvider = Provider.of(context)<CartProvider>(context);
    // List products = [];
    List wishlisList = [];

    return wishlisList.isNotEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Lista de deseos'),
            ),
            body: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return WishlistFull();
                }),
          );
  }
}
