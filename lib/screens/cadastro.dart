import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:caseirinho_app/components/my_outline_button.dart';
import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:caseirinho_app/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Image(image: AssetImage('assets/logo.png'), height: 70,),
            ),
            Center(
                child: Text(
              "Crie sua conta gratuitamente aqui",
              style: Theme.of(context).textTheme.headline5,
            )),
            SizedBox(
              height: 48,
            ),
            MyTextField(
              labelText: "Nome",
            ),
            SizedBox(
              height: 24,
            ),
            MyTextField(
              labelText: "Celular",
            ),
            SizedBox(
              height: 24,
            ),
            MyTextField(
              labelText: "E-mail",
            ),
            SizedBox(
              height: 24,
            ),
            MyTextField(
              labelText: "Senha",
            ),
            SizedBox(
              height: 24,
            ),
            MyFlatButton(
              label: "Cadastrar",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
