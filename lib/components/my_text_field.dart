import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;

  const MyTextField({
    Key key,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
