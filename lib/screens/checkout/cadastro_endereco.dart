import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroEnderecoScreen extends StatelessWidget {
  final cepFormatter = MaskTextInputFormatter(mask: "#####-###");

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
                inputFormatters: [cepFormatter],
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              MyTextField(
                labelText: "Logradouro",
              ),
              SizedBox(height: 16),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MyTextField(
                        labelText: "Número",
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: MyTextField(
                        labelText: "Complemento",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              MyTextField(
                labelText: "Bairro",
              ),
              SizedBox(height: 16),
              MyTextField(
                labelText: "Cidade",
              ),
              SizedBox(height: 16),
              MyTextField(
                labelText: "UF",
              ),
              SizedBox(height: 32),
              MyFlatButton(
                label: "Continuar",
                onPressed: () => null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
