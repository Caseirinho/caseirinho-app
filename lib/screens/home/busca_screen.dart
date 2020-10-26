import 'package:caseirinho_app/screens/home/components/categorias.dart';
import 'package:caseirinho_app/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

import 'components/busca.dart';

class BuscaScreen extends StatefulWidget {
  @override
  _BuscaScreenState createState() => _BuscaScreenState();
}

class _BuscaScreenState extends State<BuscaScreen> {
  String textoBusca;
  List resultadoBusca;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Busca(
            efetuaBusca: (v) => efetuaBusca(v),
          ),
          resultadoBusca == null ? buildCategorias() : buildResultados(),
        ],
      ),
    );
  }

  Widget buildResultados() {
    if (resultadoBusca.isEmpty) {
      return Expanded(
        child: DefaultTabController(
          length: 2,
          child: Container(
            // color: Colors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SectionTitle("Resultados"),
                TabBar(
                  labelColor: Theme.of(context).primaryColor,
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: [
                    Tab(text: "Itens",),
                    Tab(text: "Casas",),
                  ],
                ),
                // TabBarView(
                //   children: [
                //     Icon(Icons.directions_car),
                //     Icon(Icons.directions_transit),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      );
    }
  }

  efetuaBusca(v) {
    setState(() {
      textoBusca = v;
      if (isBlank(textoBusca)) {
        resultadoBusca = null;
      } else {
        resultadoBusca = [];
      }
    });
  }

  Column buildCategorias() {
    return Column(
      children: [
        SectionTitle("Categorias"),
        Categorias(),
      ],
    );
  }
}
