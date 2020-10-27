import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:caseirinho_app/screens/home/components/bullet.dart';
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
  double filtroDistancia = 1.0;
  bool filtroDistanciaAplicado = false;

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
      filtroDistanciaAplicado = false;
      filtroDistancia = 0.5;

      if (isBlank(textoBusca)) {
        resultadoBusca = null;
      } else if (textoBusca == 'bolo') {
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
            "distancia": 1.3,
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
      } else {
        resultadoBusca = [];
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
    var busca = resultadoBuscaFiltrado();
    return Column(
      children: [
        renderFiltros(),
        Expanded(
          child: ListView.builder(
            itemCount: busca.length,
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
                            image: AssetImage(busca[index]["pic"]),
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
                                busca[index]["nome"],
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "Feito por: ${busca[index]["casa"]}",
                                  style: Theme.of(context).textTheme.subtitle2,
                                )),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                ),
                                Text(busca[index]["avaliacao"].toString()),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Icon(
                                    Icons.lens,
                                    size: 3,
                                  ),
                                ),
                                Text(busca[index]["categoria"]),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Icon(
                                    Icons.lens,
                                    size: 3,
                                  ),
                                ),
                                Text(busca[index]["distancia"].toString() +
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

  void aplicaFiltroDistancia() {
    setState(() {
      filtroDistanciaAplicado = true;
    });
  }

  List resultadoBuscaFiltrado() {
    var buscaFiltrada = resultadoBusca;
    if (filtroDistanciaAplicado)
      buscaFiltrada = buscaFiltrada
          .where((element) => element['distancia'] <= filtroDistancia)
          .toList();
    return buscaFiltrada;
  }

  void showFiltroDistancia(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Distância",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: 20),
                  Text("Menos de $filtroDistancia Km"),
                  Slider(
                    value: filtroDistancia,
                    min: 0.5,
                    max: 5.0,
                    divisions: 9,
                    label: filtroDistancia.toString() + " km",
                    onChanged: (double value) {
                      setState(() {
                        filtroDistancia = value;
                      });
                    },
                  ),
                  MyFlatButton(
                    label: "Filtrar",
                    onPressed: () {
                      aplicaFiltroDistancia();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          });
        });
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
            Bullet(
              title: "Distância",
              onPress: () => showFiltroDistancia(context),
              active: filtroDistanciaAplicado,
              onDismiss: () => setState(() {
                filtroDistanciaAplicado = false;
              }),
            ),
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
