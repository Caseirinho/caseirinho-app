import 'package:caseirinho_app/screens/home/components/categorias.dart';
import 'package:caseirinho_app/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                  Tab(
                    text: "Itens",
                  ),
                  Tab(
                    text: "Perto de mim",
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    children: [
                      resultadoBusca.isEmpty
                          ? Center(child: Text("Nenhum item encontrado"))
                          : renderResultadoBuscaList(),
                      Center(child: Text("Nenhum item encontrado")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  efetuaBusca(v) {
    setState(() {
      textoBusca = v;
      if (isBlank(textoBusca)) {
        resultadoBusca = null;
      } else {
        resultadoBusca = [
          {
            "nome": "Brigadeiros da vó",
            "pic": "assets/brigadeiro.jpg",
            "avaliacao": 5.0,
            "categoria": "Docinhos",
            "distancia": 0.6,
          },
          {
            "nome": "Brigadeiros da vó",
            "pic": "assets/brigadeiro.jpg",
            "avaliacao": 5.0,
            "categoria": "Docinhos",
            "distancia": 0.6,
          },
          {
            "nome": "Brigadeiros da vó",
            "pic": "assets/brigadeiro.jpg",
            "avaliacao": 5.0,
            "categoria": "Docinhos",
            "distancia": 0.6,
          },
        ];
      }
    });
  }

  Widget buildCategorias() {
    return Column(
      children: [
        SectionTitle("Categorias"),
        Categorias(),
      ],
    );
  }

  Widget renderResultadoBuscaList() {
    return Column(
      children: [
        renderFiltros(),
        Expanded(
          child: ListView.builder(
            itemCount: resultadoBusca.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xFFE0E0E0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(resultadoBusca[0]["pic"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                resultadoBusca[0]["nome"],
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                ),
                                Text(resultadoBusca[0]["avaliacao"].toString()),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Icon(
                                    Icons.lens,
                                    size: 3,
                                  ),
                                ),
                                Text(resultadoBusca[0]["categoria"]),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Icon(
                                    Icons.lens,
                                    size: 3,
                                  ),
                                ),
                                Text(resultadoBusca[0]["distancia"].toString() +
                                    " Km"),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget renderFiltros() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Bullet(title: "Categoria"),
            SizedBox(
              width: 10,
            ),
            Bullet(title: "Distância"),
            SizedBox(
              width: 10,
            ),
            Bullet(title: "Preço"),
            SizedBox(
              width: 10,
            ),
            Bullet(title: "Prazo"),
          ],
        ),
      ),
    );
  }
}

class Bullet extends StatelessWidget {
  final title;
  final active;
  final onPress;

  const Bullet({
    Key key,
    this.title,
    this.active = false,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: active ? Colors.grey.shade400 : Colors.redAccent,
      onTap: onPress,
      child: Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: active ? Colors.redAccent : Colors.grey.shade400,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
