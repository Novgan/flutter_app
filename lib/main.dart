import 'package:flutter/material.dart';
import 'package:flutterapp/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Photos',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          textTheme: TextTheme(headline6: TextStyle(color: Color(0xFFFFFFFF))),
        ),
        home: HomePage());
  }
}


