import 'package:caseirinho_app/screens/checkout/confirmacao_compra.dart';
import 'package:caseirinho_app/stores/carrinho.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

const Color darkGrey = Color(0xff202020);

const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(236, 60, 3, 1),
  Color.fromRGBO(234, 60, 3, 1),
  Color.fromRGBO(216, 78, 16, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

class ResumoCompraScreen extends StatelessWidget {
  final carrinho = GetIt.I<Carrinho>();
  final reaisFormat = new NumberFormat.currency(locale: "pt_BR", symbol: "R\$");

  efetuaCompra(context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => ConfirmacaoCompraScreen()),
      ModalRoute.withName("/"),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget payNow = InkWell(
      onTap: () => efetuaCompra(context),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Pagar agora",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resumo da compra",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) => SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              children: <Widget>[
                Text("Itens:"),
                buildResumo(),
                Text("Endereço de entrega:"),
                buildEndereco(),
                Text("Pagamento:"),
                buildCartao(context),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: payNow,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildResumo() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: shadow,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Observer(
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                children: carrinho.itens
                    .map((item) => ListTile(
                          title: Text('${item.quantidade} ☓ ${item.nome}'),
                          trailing: Text(reaisFormat.format(item.valor)),
                        ))
                    .toList(),
              ),
              ListTile(
                title: Text('Entrega'),
                trailing: Text(reaisFormat.format(carrinho.entrega)),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  reaisFormat.format(carrinho.valorTotal),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Container buildEndereco() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: shadow,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: Observer(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('R. Padre Manuel Barreto, 114'),
                SizedBox(height: 8),
                Text('Artur Alvim'),
                SizedBox(height: 8),
                Text('São Paulo - SP'),
              ],
            ),
          );
        },
      ),
    );
  }

  Container buildCartao(context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        boxShadow: shadow,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Observer(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'CARTÃO DE CŔEDITO',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: <Widget>[
                    Container(
                      height: 25,
                      width: 40,
                      color: Colors.white,
                    ),
                    Flexible(
                      child: Center(
                        child: Text(
                          "5555 xxxx xxxxx 1234",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  "RAFAEL R BRAZ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
