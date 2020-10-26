import 'package:caseirinho_app/screens/home/busca_screen.dart';
import 'package:caseirinho_app/screens/home/home_screen.dart';
import 'package:caseirinho_app/screens/home/perfil_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeNavigator extends StatefulWidget {
  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildBody(context),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBody(BuildContext context) {
    var _children = <Widget>[
      HomeScreen(),
      BuscaScreen(),
      PerfilScreen(),
    ];

    return IndexedStack(
      index: currentIndex,
      children: _children,
    );
  }

  buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Início"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text("Busca"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Conta'),
        )
      ],
    );
  }
}
