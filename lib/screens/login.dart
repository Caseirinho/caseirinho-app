import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:caseirinho_app/components/my_outline_button.dart';
import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:caseirinho_app/screens/cadastro.dart';
import 'package:caseirinho_app/screens/home/home_navigator.dart';
import 'package:caseirinho_app/screens/recuperacao_senha.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void login() async {
    Navigator.of(context).pushReplacement(
        new CupertinoPageRoute(builder: (_) => HomeNavigator()));
  }

  void cadastrar() async {
    Navigator.of(context)
        .push(new CupertinoPageRoute(builder: (_) => CadastroScreen()));
  }

  void recuperarSenha() async {
    Navigator.of(context)
        .push(new CupertinoPageRoute(builder: (_) => RecuperacaoSenhaScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 30.0, left: 16, right: 16, bottom: 16),
                child: SvgPicture.asset(
                  'assets/login_gravure.svg',
                ),
              ),
              MyTextField(
                labelText: "E-mail",
              ),
              SizedBox(
                height: 24,
              ),
              MyTextField(
                labelText: "Senha",
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () => recuperarSenha(),
                    child: Text("esqueceu a senha?"),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              MyFlatButton(
                label: "Entrar",
                onPressed: login,
              ),
              SizedBox(
                height: 24,
              ),
              MyOutlineButton(
                label: "Cadastrar",
                onPressed: cadastrar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
