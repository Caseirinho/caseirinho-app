import 'package:flutter/material.dart';

class Categorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }

  Flexible buildCategoria(String nome) {
    return Expanded(
      child: InkWell(
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
      ),
    );
  }
}
