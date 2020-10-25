import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:caseirinho_app/components/my_outline_button.dart';
import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class LoginView extends StatelessWidget {
  final recuperarSenha;
  final login;
  final cadastrar;

  final void Function(String username) setUsername;

  final void Function(String password) setPassword;

  const LoginView({
    Key key,
    this.recuperarSenha,
    this.login,
    this.cadastrar,
    this.setUsername,
    this.setPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 16, right: 16, bottom: 8),
                  child: SvgPicture.asset(
                    'assets/login_gravure.svg',
                  ),
                ),
                MyTextField(
                  labelText: "E-mail",
                  onChanged: (value) => setUsername(value),
                ),
                SizedBox(
                  height: 8,
                ),
                MyTextField(
                  labelText: "Senha",
                  obscureText: true,
                  onChanged: (value) => setPassword(value),
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
                  height: 16,
                ),
                MyFlatButton(
                  label: "Entrar",
                  onPressed: login,
                ),
                SizedBox(
                  height: 16,
                ),
                MyOutlineButton(
                  label: "Cadastrar",
                  onPressed: cadastrar,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
