import 'package:flutter/material.dart';

class Categorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            buildCategoria("Marmitas", AssetImage('assets/marmitas-food.jpg')),
            SizedBox(
              width: 10,
            ),
            buildCategoria("Docinhos", AssetImage('assets/docinhos-food.jpg')),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            buildCategoria("Fit", AssetImage('assets/fit-food.jpg')),
            SizedBox(
              width: 10,
            ),
            buildCategoria(
                "Presentinhos", AssetImage('assets/presentinhos-croche.jpg')),
          ],
        ),
      ],
    );
  }

  Flexible buildCategoria(String nome, AssetImage imagem) {
    return Expanded(
      child: InkWell(
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imagem,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              nome,
              style: TextStyle(
                  backgroundColor: Colors.white,
                  fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
