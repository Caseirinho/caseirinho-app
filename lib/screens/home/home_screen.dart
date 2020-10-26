import 'package:caseirinho_app/screens/cadastro_casa.dart';
import 'package:caseirinho_app/screens/home/components/categorias.dart';
import 'package:caseirinho_app/screens/home/components/populares.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/section_title.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  child: Column(
                    children: [
                      Text(
                        "Cadastre sua Casa",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )
                      ),
                      SizedBox(height: 8),
                      Text(
                          "Assim que cadastrar sua casa, você já pode começar a vender seus produtos",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          )
                      ),
                    ],
                  ),

                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (_) => CadastroCasaScreen()));
              },
            ),
            SectionTitle("Categorias mais procuradas"),
            Categorias(),
            SectionTitle("Os mais procurados"),
            Populares()
          ],
        ),
      ),
    );
  }
}
