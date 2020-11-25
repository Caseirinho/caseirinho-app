import 'package:caseirinho_app/screens/produto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const brigadeiros = [
  {
    "nome": "Brigadeiro belga",
    "pic": "assets/brigadeiros/belga.webp",
    "descricao": "O delicioso brigadeiro da vó com chocolate belga ao leite.",
    "preco": 6,
  },
  {
    "nome": "Brigadeiro de ovomaltine",
    "pic": "assets/brigadeiros/ovomaltine.webp",
    "descricao": "O delicioso brigadeiro de ovomaltine da vó.",
    "preco": 5.5,
  },
  {
    "nome": "Brigadeiro de amendoim",
    "pic": "assets/brigadeiros/amendoim.webp",
    "descricao": "Coberto com amendoim triturado.",
    "preco": 5.5,
  },
  {
    "nome": "Beijinho",
    "pic": "assets/brigadeiros/beijinho.webp",
    "descricao": "Um dos mais tradicionais doces das festas brasileiras.",
    "preco": 5.5,
  },
  {
    "nome": "Bicho de pé",
    "pic": "assets/brigadeiros/bichodepe.webp",
    "descricao": "O tradicional bicho de pé brasileiro com o amor da vó.",
    "preco": 5.5,
  },
  {
    "nome": "Crocante",
    "pic": "assets/brigadeiros/crocante.webp",
    "descricao":
        "O delicioso brigadeiro da vó com cobertura crocante de castanha de caju",
    "preco": 5.5,
  },
  {
    "nome": "Brigadeiro de M&M's",
    "pic": "assets/brigadeiros/mms.jpg",
    "descricao":
        "O incrível brigadeiro da vó recheado com os confeitos mais queridos do mundo.",
    "preco": 6,
  },
];

class CasaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        // iconTheme: IconThemeData.fallback(),
        flexibleSpace: Image(
          image: AssetImage('assets/brigadeiro.jpg'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
      ),
      body: Container(
        color: Color(0xFFEAEAEA),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: brigadeiros.length,
                itemBuilder: (context, index) => buildItem(
                  context,
                  brigadeiros[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              "Brigadeiros da Vó",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 15,
              ),
              Text("5.0"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.lens,
                  size: 3,
                ),
              ),
              Text("Docinhos"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.lens,
                  size: 3,
                ),
              ),
              Text("0.6 Km"),
            ],
          ),
          SizedBox(height: 20),
          Text("Envie uma mensagem por WhatsApp para fazer seu pedido:"),
          SizedBox(height: 15),
          FlatButton.icon(
            icon: Icon(FontAwesomeIcons.whatsapp),
            color: Color(0xFF25D366),
            label: Text("Entrar em contato"),
            onPressed: () => mensagemContato(),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  mensagemContato() {
    FlutterOpenWhatsapp.sendSingleMessage("+5511949043310",
        "Olá!\nMeu nome é Maria e vi seu anúncio no Caseirinho.\nGostaria de fazer um pedido");
  }

  Padding buildItem(context, item) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () => openItem(context, item),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color(0xFFE0E0E0),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item["pic"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          item["nome"],
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Text(item["descricao"]),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  openItem(context, item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProdutoScreen(
          item: item,
        ),
      ),
    );
  }
}
