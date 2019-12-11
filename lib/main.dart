import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:next_gen_calc/App.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: //Colors.transparent,
      Color(0xffFF5545)
    ));
    return MaterialApp(
      color: Color(0xffFF5545),
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
