import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:caseirinho_app/screens/checkout/resumo_compra.dart';
import 'package:caseirinho_app/stores/carrinho.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroCartaoScreen extends StatefulWidget {
  @override
  _CadastroCartaoScreenState createState() => _CadastroCartaoScreenState();
}

class _CadastroCartaoScreenState extends State<CadastroCartaoScreen> {
  final cartaoFormatter = MaskTextInputFormatter(mask: "#### #### #### ####");

  final validadeFormatter = MaskTextInputFormatter(mask: "##/##");

  final cvvFormatter = MaskTextInputFormatter(mask: "####");

  TextEditingController numero = TextEditingController();

  TextEditingController nome = TextEditingController();

  TextEditingController validade = TextEditingController();

  TextEditingController cvv = TextEditingController();

  final carrinho = GetIt.I<Carrinho>();

  salvaCartao() {
    carrinho.cartao.numero = numero.text;
    carrinho.cartao.nome = nome.text;
    carrinho.cartao.validade = validade.text;
    carrinho.cartao.cvv = cvv.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dados de pagamento",
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildCard(context),
              SizedBox(height: 32),
              Text("Informe seus dados de cartão:"),
              SizedBox(height: 16),
              MyTextField(
                labelText: "Número",
                controller: numero,
                onChanged: (val) => setState(() {}),
                inputFormatters: [cartaoFormatter],
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              MyTextField(
                labelText: "Nome (igual no cartão)",
                controller: nome,
                inputFormatters: [UpperCaseTextFormatter()],
                onChanged: (val) => setState(() {}),
              ),
              SizedBox(height: 16),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MyTextField(
                        labelText: "Validade",
                        keyboardType: TextInputType.number,
                        controller: validade,
                        onChanged: (val) => setState(() {}),
                        inputFormatters: [validadeFormatter],
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: MyTextField(
                        labelText: "CVV",
                        keyboardType: TextInputType.number,
                        controller: cvv,
                        onChanged: (val) => setState(() {}),
                        inputFormatters: [cvvFormatter],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              MyFlatButton(
                label: "Continuar para resumo da compra",
                onPressed: () => efetuaCompra(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildCard(context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(32.0),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                      child: Text(numero.text,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0)))),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(validade.text,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text(cvv.text,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
          Spacer(),
          Text(nome.text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0))
        ],
      ),
    );
  }

  efetuaCompra(BuildContext context) {
    salvaCartao();
    Navigator.push(
        context, CupertinoPageRoute(builder: (_) => ResumoCompraScreen()));
  }
}

class UpperCaseTextFormatter implements TextInputFormatter {
  const UpperCaseTextFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text?.toUpperCase(), selection: newValue.selection);
  }
}
