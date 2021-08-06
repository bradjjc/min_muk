import 'package:flutter/material.dart';
import 'package:flutter_youtube_api/screens/pages_screens/dorosi.dart';
import 'package:flutter_youtube_api/screens/pages_screens/fume.dart';
import 'package:flutter_youtube_api/screens/pages_screens/mine.dart';
import 'package:flutter_youtube_api/screens/pages_screens/na_asmr.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';

class MainHome extends StatefulWidget {
  MainHome({Key key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _selectedIndex = 1;

  final _widgetOptions = [
    Mine(),
    NaAsmr(),
    Fume(),
    Dorosi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        centerTitle: true,
        title: Text('Min Muk',
        style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: <Color>[
                Colors.purple,
                Colors.lightBlueAccent,
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: GradientBottomNavigationBar(
        backgroundColorStart: Colors.purple,
        backgroundColorEnd: Colors.lightBlueAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), title: Text('Minee')),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined), title: Text('Narang')),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), title: Text('Fume')),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined), title: Text('Dorothy')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}