import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final obscureText;
  final hintText;

  const MyTextField({
    Key key,
    this.labelText,
    this.obscureText = false,
    this.hintText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: this.obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
