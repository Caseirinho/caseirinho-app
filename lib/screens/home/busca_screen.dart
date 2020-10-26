import 'package:caseirinho_app/screens/home/components/categorias.dart';
import 'package:caseirinho_app/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';

import 'components/busca.dart';

class BuscaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Busca(),
            SectionTitle("Categorias"),
            Categorias(),
          ],
        ),
      ),
    );
  }
}
