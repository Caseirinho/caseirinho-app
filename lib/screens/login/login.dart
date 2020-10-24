import 'package:caseirinho_app/screens/cadastro.dart';
import 'package:caseirinho_app/screens/home/home_navigator.dart';
import 'package:caseirinho_app/screens/login/login_view.dart';
import 'package:caseirinho_app/screens/recuperacao_senha.dart';
import 'package:caseirinho_app/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username;
  String password;
  final api = API();

  void login() async {
    var loginSuccess = await api.login(this.username, this.password);

    if (loginSuccess) {
      Navigator.of(context).pushReplacement(
          new CupertinoPageRoute(builder: (_) => HomeNavigator()));
    } else {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => AlertDialog(
          title: Text("Atenção"),
          content: Text("Usuário ou senha inválidos"),
          actions: <Widget>[
            FlatButton(
              child: Text('Entendi'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  void cadastrar() async {
    Navigator.of(context)
        .push(new CupertinoPageRoute(builder: (_) => CadastroScreen()));
  }

  void recuperarSenha() async {
    Navigator.of(context)
        .push(new CupertinoPageRoute(builder: (_) => RecuperacaoSenhaScreen()));
  }

  void setUsername(String username) {
    setState(() {
      this.username = username;
    });
  }

  void setPassword(String password) {
    setState(() {
      this.password = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(
      login: login,
      cadastrar: cadastrar,
      recuperarSenha: recuperarSenha,
      setUsername: setUsername,
      setPassword: setPassword,
    );
  }
}
