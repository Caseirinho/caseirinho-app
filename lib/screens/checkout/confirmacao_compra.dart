import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:flutter/material.dart';

class ConfirmacaoCompraScreen extends StatefulWidget {
  @override
  _ConfirmacaoCompraScreenState createState() =>
      _ConfirmacaoCompraScreenState();
}

class _ConfirmacaoCompraScreenState extends State<ConfirmacaoCompraScreen> {
  var loading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Recebemos seu pagamento com sucesso e encaminhamos sua compra para o vendedor. Não se preocupe que te avisaremos sobre novas atualizações.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 32),
                  MyFlatButton(
                    label: "Entendi",
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
      )),
    );
  }
}
