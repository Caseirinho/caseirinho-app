import 'package:caseirinho_app/screens/home/home_navigator.dart';
import 'package:caseirinho_app/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
    ));

    return MaterialApp(
      title: 'Caseirinho',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.lightBlueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeNavigator(),
    );
  }
}
