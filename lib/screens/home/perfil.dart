import 'package:caseirinho_app/screens/cadastro_casa.dart';
import 'package:caseirinho_app/screens/edicao_perfil.dart';
import 'package:caseirinho_app/screens/login.dart';
import 'package:caseirinho_app/screens/troca_senha.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PerfilScreen extends StatelessWidget {
  void navigateTo(BuildContext context, selectedScreen) async {
    final String result = await Navigator.of(context).push(
      CupertinoPageRoute(builder: (_) => selectedScreen),
    );

    if (result != null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
            result,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(height: 45),
              CircleAvatar(
                radius: 50,
                child: SvgPicture.asset('assets/profile-picture.svg',
                    height: double.infinity),
              ),
              SizedBox(height: 30),
              FittedBox(
                child: Text(
                  "Maria da Silva",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  "mariadasilva@gmail.com",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Divider(thickness: 1, color: Colors.grey),
              Column(
                children: <Widget>[
                  buildTile(
                    icon: Icons.person_outline,
                    text: 'Perfil',
                    tapHandler: () => navigateTo(
                      context,
                      EdicaoPerfilScreen(),
                    ),
                  ),
                  buildTile(
                    icon: Icons.create,
                    text: 'Alterar senha',
                    tapHandler: () => navigateTo(
                      context,
                      TrocaDeSenhaScreen(),
                    ),
                  ),
                  buildTile(
                    icon: Icons.exit_to_app,
                    text: 'Sair',
                    tapHandler: () => logout(context),
                  ),
                ],
              ),
              Divider(thickness: 1, color: Colors.grey),
              Column(children: <Widget>[
                buildTile(
                  icon: Icons.home,
                  text: 'Começar a vender',
                  tapHandler: () => navigateTo(
                    context,
                    CadastroCasaScreen(),
                  ),
                ),
              ]),
              Divider(thickness: 1, color: Colors.grey),
              SizedBox(height: 12),
              buildContactInformation('contato@caseirinho.com.br'),
              SizedBox(height: 4),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  buildTile({IconData icon, String text, Function tapHandler}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  buildContactInformation(String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey),
        textAlign: TextAlign.start,
      ),
    );
  }

  void logout(BuildContext context) {
    // api.logout();
    Navigator.of(context)
        .pushReplacement(CupertinoPageRoute(builder: (_) => LoginScreen()));
  }
}
