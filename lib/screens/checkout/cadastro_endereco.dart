import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:caseirinho_app/stores/carrinho.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'cadastro_cartao.dart';

class CadastroEnderecoScreen extends StatelessWidget {
  final cepFormatter = MaskTextInputFormatter(mask: "#####-###");

  final cep = TextEditingController();
  final logradouro = TextEditingController();
  final numero = TextEditingController();
  final complemento = TextEditingController();
  final bairro = TextEditingController();
  final cidade = TextEditingController();
  final uf = TextEditingController();

  final Carrinho carrinho = GetIt.I<Carrinho>();

  salvaEndereco() {
    carrinho.endereco.cep = cep.text;
    carrinho.endereco.logradouro = logradouro.text;
    carrinho.endereco.numero = numero.text;
    carrinho.endereco.complemento = complemento.text;
    carrinho.endereco.bairro = bairro.text;
    carrinho.endereco.cidade = cidade.text;
    carrinho.endereco.uf = uf.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Endereço de entrega",
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
              MyTextField(
                labelText: "CEP",
                controller: cep,
                inputFormatters: [cepFormatter],
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              MyTextField(
                labelText: "Logradouro",
                controller: logradouro,
              ),
              SizedBox(height: 16),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MyTextField(
                        labelText: "Número",
                        controller: numero,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: MyTextField(
                        labelText: "Complemento",
                        controller: complemento,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              MyTextField(
                labelText: "Bairro",
                controller: bairro,
              ),
              SizedBox(height: 16),
              MyTextField(
                labelText: "Cidade",
                controller: cidade,
              ),
              SizedBox(height: 16),
              MyTextField(
                labelText: "UF",
                controller: uf,
              ),
              SizedBox(height: 32),
              MyFlatButton(
                label: "Continuar para pagamento",
                onPressed: () => continuarPagamento(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  continuarPagamento(BuildContext context) {
    salvaEndereco();
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => CadastroCartaoScreen()),
    );
  }
}
