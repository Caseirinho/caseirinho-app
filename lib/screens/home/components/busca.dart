import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:caseirinho_app/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';

class Busca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle("Buscar items"),
        MyTextField(
          labelText: "Item ou casa",
        ),
      ],
    );
  }
}
