import 'package:caseirinho_app/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';

class Busca extends StatefulWidget {
  final efetuaBusca;

  const Busca({Key key, this.efetuaBusca}) : super(key: key);

  @override
  _BuscaState createState() => _BuscaState();
}

class _BuscaState extends State<Busca> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle("Buscar items"),
        TextFormField(
          textInputAction: TextInputAction.search,
          onFieldSubmitted: widget.efetuaBusca,
          decoration: InputDecoration(
            labelText: 'Item ou casa',
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
