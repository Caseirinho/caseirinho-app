import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecuperacaoSenhaScreen extends StatefulWidget {
  @override
  _RecuperacaoSenhaScreenState createState() => _RecuperacaoSenhaScreenState();
}

class _RecuperacaoSenhaScreenState extends State<RecuperacaoSenhaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperação de Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Image(
                image: AssetImage('assets/logo.png'),
                height: 70,
              ),
            ),
            Center(
                child: Text(
              "Insira seu endereço de e-mail parar receber um link de redefinição de senha",
            )),
            SizedBox(
              height: 24,
            ),
            MyTextField(
              labelText: "E-mail",
            ),
            SizedBox(
              height: 24,
            ),
            MyFlatButton(
              label: "Recuperar minha senha",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
