import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EdicaoPerfilScreen extends StatefulWidget {
  @override
  _EdicaoPerfilScreenState createState() => _EdicaoPerfilScreenState();
}

class _EdicaoPerfilScreenState extends State<EdicaoPerfilScreen> {
  void atualizarDados(context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atualizar perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            MyFlatButton(
              label: "Atualizar",
              onPressed: () => atualizarDados(context),
            ),
          ],
        ),
      ),
    );
  }
}
