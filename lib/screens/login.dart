import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:caseirinho_app/components/my_outline_button.dart';
import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Caseiro'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 16, right: 16, bottom: 16),
              child: SvgPicture.asset(
                'assets/login_gravure.svg',
              ),
            ),
            MyTextField(
              labelText: "E-mail",
            ),
            SizedBox(height: 24,),
            MyTextField(
              labelText: "Senha",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () => null,
                  child: Text("esqueceu a senha?"),
                ),
              ],
            ),
            SizedBox(height: 24,),
            MyFlatButton(
              label: "Entrar",
            ),
            SizedBox(height: 24,),
            MyOutlineButton(
              label: "Cadastrar",
            ),
          ],
        ),
      ),
    );
  }
}
