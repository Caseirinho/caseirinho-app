import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastroCasaScreen extends StatefulWidget {
  @override
  _CadastroCasaScreenState createState() => _CadastroCasaScreenState();
}

class _CadastroCasaScreenState extends State<CadastroCasaScreen> {
  double _currentSliderValue = 1;

  void cadastrar(context) {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar sua Casa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              "Cadastre as informações da sua casa para começar a vender",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 24,
            ),
            MyTextField(
              labelText: "Nome da sua Casa",
              hintText: "Ex.: Docinhos da Maria",
            ),
            SizedBox(
              height: 24,
            ),
            MyTextField(
              labelText: "Endereço e número",
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "Raio de entrega: $_currentSliderValue km",
              ),
            ),
            Slider(
              value: _currentSliderValue,
              min: 0.5,
              max: 5,
              divisions: 9,
              label: _currentSliderValue.toString() + " km",
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            SizedBox(
              height: 60,
            ),
            MyFlatButton(
              label: "Cadastrar",
              onPressed: () => cadastrar(context),
            ),
          ],
        ),
      ),
    );
  }
}
