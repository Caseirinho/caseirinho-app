import 'package:caseirinho_app/screens/home/home_navigator.dart';
import 'package:caseirinho_app/stores/carrinho.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<Carrinho>(Carrinho());
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
