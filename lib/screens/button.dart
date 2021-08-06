import 'package:flutter/material.dart';
import 'package:animated_float_action_button/animated_floating_action_button.dart';
import 'package:animated_float_action_button/float_action_button_text.dart';
import 'package:flutter_youtube_api/screens/pages_screens/dorosi.dart';
import 'package:flutter_youtube_api/screens/pages_screens/fume.dart';
import 'package:flutter_youtube_api/screens/pages_screens/mine.dart';
import 'package:flutter_youtube_api/screens/pages_screens/na_asmr.dart';


class Button extends StatefulWidget {
  const Button({Key key}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  final GlobalKey<AnimatedFloatingActionButtonState> fabKey = GlobalKey();
  int _selectedIndex = 0;

  final _widgetOptions = [
    Mine(),
    NaAsmr(),
    Fume(),
    Dorosi(),
  ];

  Widget mine() {
    return FloatActionButtonText(
      onPressed: (){
        setState(() {
          _selectedIndex = 0;
        });
        fabKey.currentState.animate();
      },
      icon: Icons.favorite_border_outlined,
      text: "Minee",
      textLeft: -100,
    );
  }

  Widget na_asmr() {
    return FloatActionButtonText(
      onPressed: (){
        setState(() {
          _selectedIndex = 1;
        });
        fabKey.currentState.animate();
      },
      icon: Icons.favorite_outlined,
      text: "Narang",
      textLeft: -100,
    );
  }

  Widget fune() {
    return FloatActionButtonText(
      onPressed: (){
        setState(() {
          _selectedIndex = 2;
        });
        fabKey.currentState.animate();
      },
      icon: Icons.favorite_border_outlined,
      textLeft: -100,
      text: "Fume",
    );
  }

  Widget dorsi() {
    return FloatActionButtonText(
      onPressed: (){
        setState(() {
          _selectedIndex = 3;
        });
        fabKey.currentState.animate();
      },
      icon: Icons.favorite_outlined,
      textLeft: -100,
      text: "Dorothy",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedFloatingActionButton(
          key: fabKey,
          fabButtons: <Widget>[
            mine(),
            na_asmr(),
            fune(),
            dorsi(),
          ],
          colorStartAnimation: Colors.blue,
          colorEndAnimation: Colors.red,
          animatedIconData: AnimatedIcons.menu_close, //To principal button
      ),
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
    );
  }
}
