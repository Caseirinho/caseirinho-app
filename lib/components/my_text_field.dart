import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final obscureText;
  final hintText;
  final onChanged;

  const MyTextField({
    Key key,
    this.labelText,
    this.onChanged,
    this.obscureText = false,
    this.hintText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
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
