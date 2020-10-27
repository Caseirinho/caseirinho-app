import 'package:flutter/material.dart';

class Populares extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            buildPopulares("Brigadeiros da vó", AssetImage('assets/brigadeiro.jpg')),
            SizedBox(width: 5,),
            buildPopulares("Alzira bordado", AssetImage('assets/bordado.jpg')),
            SizedBox(width: 5,),
            buildPopulares("Amigurumi da Má", AssetImage('assets/amigurumi.jpg')),
          ],
        ),
      ],
    );
  }

  Flexible buildPopulares(String nome, AssetImage imagem) {
    return Expanded(
      child: InkWell(
        child: Container(
          height: 80,
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
