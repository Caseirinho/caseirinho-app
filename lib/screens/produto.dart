import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:caseirinho_app/components/number_inc_dec.dart';
import 'package:caseirinho_app/screens/checkout/carrinho.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ProdutoScreen extends StatefulWidget {
  final item;

  ProdutoScreen({Key key, @required this.item}) : super(key: key);

  @override
  _ProdutoScreenState createState() => _ProdutoScreenState();
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  int quantidade = 1;
  final reaisFormat = new NumberFormat.currency(locale: "pt_BR", symbol: "R\$");

  setQuantidade(int value) {
    this.setState(() {
      quantidade = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.item["nome"],
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage(this.widget.item["pic"]),
              height: 300,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(this.widget.item["descricao"]),
                  SizedBox(height: 16),
                  Text(
                    reaisFormat.format(this.widget.item["preco"]),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 32),
                  MyTextField(
                    labelText: "Observações",
                    maxLines: 8,
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      NumberIncDec(
                        value: this.quantidade,
                        onChange: this.setQuantidade,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: MyFlatButton(
                          label: "Adicionar",
                          onPressed: () => null,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  openCarrinho(context) {
    var openFromBottom = (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    };

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => CarrinhoScreen(),
        transitionsBuilder: openFromBottom,
      ),
    );
  }
}
