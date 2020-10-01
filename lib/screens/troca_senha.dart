import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class TrocaDeSenhaScreen extends StatelessWidget {

  void alterarSenha(context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alterar Senha'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MyTextField(
                labelText: "Senha atual",
                obscureText: true,
              ),
              SizedBox(
                height: 24,
              ),
              MyTextField(
                labelText: "Nova senha",
                obscureText: true,
              ),
              SizedBox(
                height: 24,
              ),
              MyFlatButton(
                label: "Alterar senha",
                onPressed: () => alterarSenha(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
