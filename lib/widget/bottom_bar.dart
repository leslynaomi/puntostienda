import 'package:flutter/material.dart';
import 'package:puntotienda/screens/cart.dart';
import 'package:puntotienda/screens/feeds.dart';
import 'package:puntotienda/screens/home.dart';
import 'package:puntotienda/screens/search.dart';
import 'package:puntotienda/screens/user.dart';

class BottomBarScreen extends StatefulWidget {
  //static const routeName = 'BottomBarScreen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List _pages = [
    HomeScreen(),
    FeedsScreen(),
    SearchScreen(),
    CartScreen(),
    UserScreen(),
  ];

  int _selectedindex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 3,
        clipBehavior: Clip.antiAlias,
        //elevation: 5,
        shape: CircularNotchedRectangle(),
        child: Container(
          //  height: kBottomNavigationBarHeight,
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(width: 0.5),
          )),
          child: BottomNavigationBar(
            onTap: _selectedPage,
            backgroundColor: Theme.of(context).primaryColor,
            // ignore: deprecated_member_use
            unselectedItemColor: Theme.of(context).textSelectionColor,
            selectedItemColor: Colors.purple,
            currentIndex: _selectedindex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), tooltip: 'Home', label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.rss_feed), tooltip: 'Feeds', label: 'Feeds'),
              BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  tooltip: 'Search',
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag),
                  tooltip: 'Cart',
                  label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), tooltip: 'User', label: 'User'),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        tooltip: 'Search',
        elevation: 5,
        child: (Icon(Icons.search)),
        onPressed: () {
          setState(() {
            _selectedindex = 2;
          });
        },
      ),
    );
  }
}