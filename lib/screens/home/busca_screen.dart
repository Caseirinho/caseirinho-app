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
            "nome": "Cheese cake tradicional",
            "casa": "Maria doces e bolos",
            "pic": "assets/cheese-cake.jpg",
            "avaliacao": 5.0,
            "categoria": "Bolos",
            "distancia": 0.4,
          },
          {
            "nome": "Cupcake de morango",
            "casa": "Brigadeira Vila Maria",
            "pic": "assets/cupcake.jpg",
            "avaliacao": 4.8,
            "categoria": "Bolos",
            "distancia": 0.8,
          },
          {
            "nome": "Bolo de chocolate trufado",
            "casa": "Brigadeiros da vó",
            "pic": "assets/bolo-chocolate.jpg",
            "avaliacao": 4.5,
            "categoria": "Bolos",
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
                            image: AssetImage(resultadoBusca[index]["pic"]),
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
                                resultadoBusca[index]["nome"],
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "Feito por: ${resultadoBusca[index]["casa"]}",
                                  style: Theme.of(context).textTheme.subtitle2,
                                )),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                ),
                                Text(resultadoBusca[index]["avaliacao"].toString()),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Icon(
                                    Icons.lens,
                                    size: 3,
                                  ),
                                ),
                                Text(resultadoBusca[index]["categoria"]),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Icon(
                                    Icons.lens,
                                    size: 3,
                                  ),
                                ),
                                Text(resultadoBusca[index]["distancia"].toString() +
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
