import 'package:caseirinho_app/screens/cadastro_casa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Olá, Maria",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              "Seja bem vinda!",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              child: Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      "Aperte aqui para cadastrar sua Casa e começar a vender seus produtos"),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (_) => CadastroCasaScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
