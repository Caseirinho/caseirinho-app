import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class Busca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextLabel("Buscar items"),
          MyTextField(
            labelText: "Item ou loja",
          ),
          buildTextLabel("Categorias"),
          Row(
            children: [
              buildCategoria("Marmitas"),
              SizedBox(
                width: 10,
              ),
              buildCategoria("Docinhos"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              buildCategoria("Fit"),
              SizedBox(
                width: 10,
              ),
              buildCategoria("Presentinhos"),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildTextLabel(label) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Flexible buildCategoria(String nome) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(nome),
        ),
      ),
    );
  }
}
