import 'package:flutter/material.dart';
import 'package:next_gen_calc/Calc.dart';
import 'package:next_gen_calc/Menu.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[Menu(), Calc()],
    );
  }
}
